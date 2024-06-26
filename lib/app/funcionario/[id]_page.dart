import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:matricular/matricular.dart';
import 'package:matricularApp/app/api/AppAPI.dart';
import 'package:matricularApp/routes.dart';
import 'package:provider/provider.dart';
import 'package:routefly/routefly.dart';
import 'package:signals/signals_flutter.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  final _addFormKey = GlobalKey<FormState>();
  AppAPI? appAPI;
  late Matricular matricularApi;

  var id = 0;
  final nome = signal('');
  final cpf = signal('');
  final email = signal('');
  final cargo = signal('');
  final telefone = signal('');
  late final isValid =
      computed(() => nome().isNotEmpty 
        && cpf().isNotEmpty
        && email().isNotEmpty
        && cargo().isNotEmpty
        && telefone().isNotEmpty
        );

  TextEditingController nomeController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController cargoController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();
  

  void showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message, style: const TextStyle(fontSize: 22.0)),
    ));
  }

  validateForm() async {
    final usuarioApi = matricularApi.getUsuarioControllerApi();
    final authAPIApi = matricularApi.getAuthAPIApi();

    try {
      var usuarioBuilder = UsuarioAlterarDTOBuilder();
      usuarioBuilder.id = id;
      usuarioBuilder.pessoaCpf = cpf();
      usuarioBuilder.pessoaNome = nome();
      usuarioBuilder.pessoaTelefone = telefone();
      usuarioBuilder.email = email();
      usuarioBuilder.cargo = UsuarioAlterarDTOCargoEnum.valueOf(cargo());
      var dado = await authAPIApi.getInfoByToken(authorization: appAPI!.config.token.value);
      usuarioBuilder.idUsuarioRequisicao = dado.data?.id;

      final response = await usuarioApi.usuarioControllerNovoAlterar(id: id, usuarioAlterarDTO: usuarioBuilder.build());
      debugPrint("Dados do Usuario");
      debugPrint(response.data.toString());
      if (response.statusCode == 200) {
        showMessage(context, "Funcionário: ${response.data?.pessoaNome} atualizado com sucesso");
        Routefly.navigate(routePaths.funcionario.listFuncionario);
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

  carregarDados(Matricular matricularApi) {
    final usuarioApi = matricularApi.getUsuarioControllerApi();
    usuarioApi.usuarioControllerObterPorId(id: Routefly.query["id"]).then((response) {
      var usuarioDto = response.data;
      id = usuarioDto!.id!;
      nomeController.text = usuarioDto!.pessoaNome??"";
      nome.set(usuarioDto!.pessoaNome??"");
      cpfController.text = usuarioDto!.pessoaCpf??"";
      cpf.set(usuarioDto!.pessoaCpf??"");
      emailController.text = usuarioDto!.email??"";
      email.set(usuarioDto!.email??"");
      cargoController.text = usuarioDto!.cargo?.name??"";
      cargo.set(usuarioDto!.cargo?.name??"");
      telefoneController.text = usuarioDto!.pessoaTelefone??"";
      telefone.set(usuarioDto!.pessoaTelefone??"");
    });
    
  }

  @override
  Widget build(BuildContext context) {
    if (appAPI == null) {
      appAPI = context.read<AppAPI>();
      matricularApi = appAPI!.api;
      carregarDados(matricularApi);
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Novo funcionário'),
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
                    child: TextFormField(
                      onChanged: email.set,
                      controller: emailController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), label: Text("email")),
                    )),
                const Spacer(
                  flex: 1,
                ),
                Flexible(
                    flex: 3,
                    child: TextFormField(
                      onChanged: cargo.set,
                      controller: cargoController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), label: Text("cargo")),
                    )),
                const Spacer(
                  flex: 1,
                ),
                Flexible(
                    flex: 3,
                    child: TextFormField(
                      onChanged: telefone.set,
                      controller: telefoneController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), label: Text("telefone")),
                    )),
                const Spacer(
                  flex: 1,
                ),
                Flexible(
                  flex: 3,
                  child: FractionallySizedBox(
                    widthFactor: 0.4,
                    heightFactor: 0.5,
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
				currentIndex: 0,
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
  void onTabTapped(int index) {
    if(index==0) Routefly.navigate(routePaths.home);
    if(index==1) Routefly.navigate(routePaths.conta);
    if(index==2) Routefly.navigate(routePaths.funcionario.listFuncionario);
  }
}