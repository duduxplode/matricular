import 'package:built_collection/src/list.dart';
import 'package:matricular/matricular.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:matricularApp/routes.dart';
import 'package:routefly/routefly.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signals/signals_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final url = signal('');

  final login = signal('');
  final password = signal('');
  late final isValid =
      computed(() => login().isNotEmpty && password().isNotEmpty);
  final passwordError = signal<String?>(null);

  @override
  void initState() {
    _loadPreferences();
    super.initState();
  }

  // Method to load the shared preference data
  void _loadPreferences() {
    //WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    SchedulerBinding.instance.scheduleFrameCallback((timeStamp) async {
      final prefs = await SharedPreferences.getInstance();
      url.set(prefs.getString('URL') ?? 'http://localhost:8080/');
    });
  }

  validateForm() async {
    var ok = false;
    if (password().length > 4) {
      passwordError.value = null;
      ok = true;
    } else {
      passwordError.value = 'Erro! Mínimo de 4 caracteres';
    }

    if(ok) {
    //   final api = Matricular(basePathOverride: url()).();
    //   final String nome = login(); // String |

    //   try {
    //     final response = await api.helloWorld( nome: nome);
    //     print(response);
    //   } on DioException catch (e) {
    //     print("Exception when calling ControllerHelloWorldApi->helloWorld: $e\n");
    //   };
    debugPrint("URL %ss"+url());
    final authApi = Matricular(basePathOverride: url()).getAuthAPIApi();
    try {
      AuthDTOBuilder authDTOBuilder = AuthDTOBuilder();
      authDTOBuilder.login = login.get();
      authDTOBuilder.senha = password.get();

      final prefs = await SharedPreferences.getInstance();
      final response = await authApi.login(authDTO: authDTOBuilder.build());
      prefs.setString('login', response.data.toString());
      
      // print(prefs.getString('login'));
    } on DioException catch (e) {
        print("Exception when calling AuthAPIApi->login: $e\n");
      };

    debugPrint("ok validado");
      Routefly.push(routePaths.home);
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Tela de login'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          height: MediaQuery.of(context).size.height - 120,
          //height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Flexible(
                flex: 6,
                child: FractionallySizedBox(
                  widthFactor: 0.6,
                  child: FittedBox(
                    fit: BoxFit.fitHeight,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Image(
                        image: AssetImage("web/images/logo_associacao_sagrada_familia.png")
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              Flexible(
                  flex: 3,
                  child: TextField(
                    onChanged: login.set,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), label: Text("email")),
                  )),
              const Spacer(
                flex: 1,
              ),
              Flexible(
                  flex: 3,
                  child: TextField(
                    onChanged: password.set,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        label: const Text("password"),
                        errorText: passwordError.watch(context)),
                    enableSuggestions: false,
                    autocorrect: false,
                    obscureText: true,
                  )),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Flexible(
                  flex: 2,
                  child: Text(
                    'Forget password',
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: FractionallySizedBox(
                  widthFactor: 0.4,
                  heightFactor: 0.4,
                  child: FilledButton(
                    onPressed: isValid.watch(context) ? validateForm : null,
                    child: const Text('Login'),
                  ),
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              Flexible(
                flex: 2,
                child: TextButton(
                  onPressed: () {
                    Routefly.push(routePaths.prefs);
                  },
                  child: const Text(
                    'Alterar URL Servidor:',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}