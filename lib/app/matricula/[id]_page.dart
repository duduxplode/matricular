import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:matricular/matricular.dart';
import 'package:matricularApp/app/api/AppAPI.dart';
import 'package:matricularApp/app/login/login_state.dart';
import 'package:matricularApp/routes.dart';
import 'package:provider/provider.dart';
import 'package:routefly/routefly.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signals/signals_flutter.dart';
import 'package:built_collection/built_collection.dart';


class StartPage extends StatefulWidget {
  

  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  AppAPI? appAPI;
  late Matricular matricularApi;
  LoginState state = LoginState();
  final _addFormKey = GlobalKey<FormState>();

  var id = 0;
  final nome = signal('');
  final cpf = signal('');
  final dataNascimento = signal<Date>(Date.now());
  final status = signal('');
  var imageFile = null;
  var image = null;
  late final isValid =
      computed(() => nome().isNotEmpty 
        && cpf().isNotEmpty
        && status().isNotEmpty
        );

  TextEditingController nomeController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController dataNascimentoController = TextEditingController();
  TextEditingController statusController = TextEditingController();

  final list = <String>['','AGUARDANDO_RENOVAÇÃO', 'AGUARDANDO_ACEITE', 'ATIVO', 'INATIVO'];

  void sair() {
    appAPI?.config.token.set("null");
    Routefly.navigate(routePaths.login);
  }

  carregarDados(Matricular matricularApi) {
    final matriculaApi = matricularApi.getMatriculaControllerApi();
    matriculaApi.matriculaControllerObterPorId(id: Routefly.query["id"]).then((response) {
      var matriculaDto = response.data;
      id = matriculaDto!.id!;
      nomeController.text = matriculaDto!.nome??"";
      nome.set(matriculaDto!.nome??"");
      cpfController.text = matriculaDto!.cpf??"";
      cpf.set(matriculaDto!.cpf??"");
      dataNascimentoController.text = matriculaDto!.nascimento.toString()??"";
      dataNascimento.set(matriculaDto.nascimento??DateTime.now().toDate());
      statusController.text = matriculaDto!.status!.name??"";
      status.set(matriculaDto!.status!.name??"");
      /*matriculaApi.matriculaControllerObterDocumentoMatricula(documentoMatriculaDTO: matriculaDto.documentoMatricula![0]).then((value) {
        imageFile = File.fromRawPath(value.data!);
        image = Image.file(imageFile);
      });*/
    });
    
  }

  void showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message, style: const TextStyle(fontSize: 22.0)),
    ));
  }

  validateForm() async {
    final matriculaApi = matricularApi.getMatriculaControllerApi();
    final authAPIApi = matricularApi.getAuthAPIApi();

    try {
      var data = await matriculaApi.matriculaControllerObterPorId(id: id);
      var matriculaDTOBuilder = data.data!.toBuilder();
      matriculaDTOBuilder.cpf = cpf();
      matriculaDTOBuilder.nome = nome();
      matriculaDTOBuilder.nascimento = dataNascimento();
      matriculaDTOBuilder.status = MatriculaDTOStatusEnum.valueOf(status());
      final response = await matriculaApi.matriculaControllerAlterar(id:id, matriculaDTO: matriculaDTOBuilder.build());

      debugPrint("Dados da Matrícula");
      debugPrint(response.data.toString());
      if (response.statusCode == 200) {
        showMessage(context, "Matrícula: ${response.data?.id} atualizada com sucesso");
        Routefly.push(routePaths.matricula.listMatricula,arguments: "",rootNavigator: true);
      } else {
        message() {
          showMessage(context, "Atualização Falhou: ${response.data}");
        }
        message();
      }
    } on DioException catch (e) {
      MessageResponseBuilder responseBuilder = MessageResponseBuilder();
      responseBuilder.message = e.response?.data["message"];
      responseBuilder.status = e.response?.data["status"];
      responseBuilder.error = e.response?.data["error"];
      responseBuilder.code = e.response?.data["code"];
      MessageResponse response = responseBuilder.build();

      message() {
        showMessage(context, "Atualização Falhou: ${response.message}");
      }
      message();
      print(
          "Exception when calling usuarioControllerAlterar: $e\n${e.response}");
    }
    ;
  }

  ImageProvider<Object> carregarImagem() {
    if (imageFile == null)
      return AssetImage("web/images/logo_associacao_sagrada_familia.png");
    else
      return FileImage(imageFile);
  }

  @override
  Widget build(BuildContext context) {
    if (appAPI == null) {
      appAPI = context.read<AppAPI>();
      matricularApi = appAPI!.api;
      carregarDados(matricularApi);
    }
    if(appAPI?.config.token.get() == "null" || 
      appAPI?.config.token.get() == "") Routefly.navigate(routePaths.login);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Matrícula '+ id.toString()),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            tooltip: 'Sair',
            onPressed: this.state.isValid.watch(context)
                        ? null
                        : () => {sair()},
          ),
        ],
      ),
      body: Form(
        key: _addFormKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            height: MediaQuery.of(context).size.height - 120,
            //height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                /*const Flexible(
                  flex: 6,
                  child: FractionallySizedBox(
                    widthFactor: 0.6,
                    child: FittedBox(
                      fit: BoxFit.fitHeight,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Image(
                          image: imageFile == null
                            ? AssetImage("web/images/logo_associacao_sagrada_familia.png")
                            : FileImage(imageFile)
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(
                  flex: 1,
                ),*/
                Flexible(
                    flex: 3,
                    child: TextFormField(
                      onChanged: nome.set,
                      controller: nomeController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), label: Text("nome")),
                    )),
                const Spacer(
                  flex: 1,
                ),
                Flexible(
                    flex: 3,
                    child: TextFormField(
                      onChanged: cpf.set,
                      controller: cpfController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), label: Text("cpf")),
                    )),
                const Spacer(
                  flex: 1,
                ),
                Flexible(
                    flex: 3,
                    child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                      Text(
                          "Data da Criação: ${dataNascimento.watch(context).toDateTime().toLocal().toString().split(' ')[0]}"
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      ElevatedButton(
                        onPressed: () => _selectDate(context),
                        child: const Icon(Icons.date_range),
                      )
                    ]),
                ),
                const Spacer(
                  flex: 1,
                ),
                Flexible(
                    flex: 3,
                    child: DropdownButtonFormField<String>(
                    value: status.value,
                    hint: Text('Selecione uma validação'),
                    onChanged: (newValue) {
                      setState(() {
                        status.value = newValue!;
                      });
                    },
                    items: list.map((value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )
                ),
                const Spacer(
                  flex: 1,
                ),
                Flexible(
                  flex: 3,
                  child: FractionallySizedBox(
                    widthFactor: 0.4,
                    heightFactor: 0.4,
                    child: FilledButton(
                      onPressed: isValid.watch(context) ? validateForm : null,
                      child: const Text('Salvar'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
				currentIndex: 1,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Minha conta"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: "Lista"
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: dataNascimento().toDateTime(),
        firstDate: DateTime(2000, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != dataNascimento().toDateTime()) {
      dataNascimento.set(picked.toDate());
      debugPrint("Nova data${dataNascimento()}");
    }
  }

  void onTabTapped(int index) {
    if(index==0) Routefly.navigate(routePaths.home);
    if(index==1) Routefly.navigate(routePaths.conta);
    if(index==2) Routefly.navigate(routePaths.matricula.listMatricula);
  }
}