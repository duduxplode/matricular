import 'package:flutter/material.dart';
import 'package:matricular/matricular.dart';
import 'package:matricularApp/app/api/AppAPI.dart';
import 'package:matricularApp/app/login/login_state.dart';
import 'package:matricularApp/routes.dart';
import 'package:provider/provider.dart';
import 'package:routefly/routefly.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signals/signals_flutter.dart';


class HomePage extends StatefulWidget {
  

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late AppAPI appAPI;
  LoginState state = LoginState();

  void sair() {
    appAPI.config.token.set("null");
    Routefly.navigate(routePaths.login);
  }

  @override
  Widget build(BuildContext context) {
    appAPI = context.read<AppAPI>();
    if(appAPI.config.token.get() == "null" || 
      appAPI.config.token.get() == "") Routefly.navigate(routePaths.login);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Home'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.person),
            tooltip: 'Conta',
            onPressed: this.state.isValid.watch(context)
                        ? null
                        : () => {Routefly.navigate(routePaths.conta)},
          ),
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            tooltip: 'Sair',
            onPressed: this.state.isValid.watch(context)
                        ? null
                        : () => {sair()},
          ),
        ],
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
                child: Text(
                  'Inicio',
                  style: TextStyle(fontSize: 20)
                  ),
              ),
            ],
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
              icon: Icon(Icons.list),
              label: "Matrículas"
          ),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.contacts),
          //     label: "Contatos"
          // ),
          BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: "Funcionários",
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    if(index==0) Routefly.navigate(routePaths.home);
    if(index==1) Routefly.navigate(routePaths.matricula.listMatricula);
    if(index==2) Routefly.navigate(routePaths.funcionario.listFuncionario);
  }
}