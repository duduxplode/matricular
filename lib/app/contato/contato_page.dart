import 'package:flutter/material.dart';
import 'package:matricular/matricular.dart';
import 'package:matricularApp/app/api/AppAPI.dart';
import 'package:matricularApp/app/login/login_state.dart';
import 'package:matricularApp/routes.dart';
import 'package:provider/provider.dart';
import 'package:routefly/routefly.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signals/signals_flutter.dart';


class StartPage extends StatefulWidget {
  

  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  late AppAPI appAPI;
  LoginState state = LoginState();

  void sair() {
    appAPI.config.token.set("null");
    Routefly.navigate(routePaths.login);
  }

  @override
  Widget build(BuildContext context) {
    appAPI = context.read<AppAPI>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Contato'),
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
                child: Text('Inicio'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
				currentIndex: 2,
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
              icon: Icon(Icons.contacts),
              label: "Contatos"
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    if(index==0) Routefly.navigate(routePaths.home);
    if(index==1) Routefly.navigate(routePaths.conta);
    if(index==2) Routefly.navigate(routePaths.contato);
  }
}