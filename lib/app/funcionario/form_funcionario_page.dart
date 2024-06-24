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
  late AppAPI appAPI;
  late Matricular matricularApi;

  final nome = signal('');
  final cpf = signal('');
  final email = signal('');
  final cargo = signal('');
  final telefone = signal('');
  final senha = signal('');
  final confirmarSenha = signal('');
  late final isValid =
      computed(() => nome().isNotEmpty 
        && cpf().isNotEmpty
        && email().isNotEmpty
        && cargo().isNotEmpty
        && telefone().isNotEmpty
        && senha().isNotEmpty
        && confirmarSenha().isNotEmpty
        );
  final passwordError = signal<String?>(null);

  void showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message, style: const TextStyle(fontSize: 22.0)),
    ));
  }

  validateForm() async {
    var ok = false;
    if (senha().length >= 6 || confirmarSenha().length >= 6) {
      passwordError.value = null;
      ok = true;
    } else {
      passwordError.value = 'Erro! Mínimo de 6 caracteres';
    }

    if (ok) {
      final usuarioApi = matricularApi.getUsuarioControllerApi();

      try {
        var usuarioBuilder = UsuarioDTOBuilder();
        usuarioBuilder.pessoaCpf = cpf();
        usuarioBuilder.pessoaNome = nome();
        usuarioBuilder.pessoaTelefone = telefone();
        usuarioBuilder.email = email();
        usuarioBuilder.cargo = UsuarioDTOCargoEnum.COORDENADORA;
        usuarioBuilder.senha = senha();

        final response = await usuarioApi.usuarioControllerIncluir(usuarioDTO: usuarioBuilder.build());
        debugPrint("Dados do Usuario");
        debugPrint(response.data.toString());
        if (response.statusCode == 200) {
          showMessage(context, "Funcionário: ${response.data?.pessoaNome} inserido com sucesso");
          Routefly.navigate(routePaths.funcionario.listFuncionario);
        } else {
          message() {
            showMessage(context, "Inserção Falhou: ${response.data}");
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

          showMessage(context, "Inserção Falhou: ${response.message}");
        }
        message();
        print(
            "Exception when calling usuarioControllerIncluir: $e\n${e.response}");
      }
      ;
    }
  }

  @override
  Widget build(BuildContext context) {
    appAPI = context.read<AppAPI>();
    matricularApi = appAPI.api;
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
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(), label: Text("telefone")),
                    )),
                const Spacer(
                  flex: 1,
                ),
                Flexible(
                    flex: 3,
                    child: TextFormField(
                      onChanged: senha.set,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          label: const Text("senha"),
                          errorText: passwordError.watch(context)),
                      enableSuggestions: false,
                      autocorrect: false,
                      obscureText: true,                
                    )),
                const Spacer(
                  flex: 1,
                ),
                Flexible(
                    flex: 3,
                    child: TextFormField(
                      onChanged: confirmarSenha.set,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          label: const Text("confirmarSenha"),
                          errorText: passwordError.watch(context)),
                      enableSuggestions: false,
                      autocorrect: false,
                      obscureText: true,                
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
                      child: const Text('Enviar'),
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