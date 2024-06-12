import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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
  late AppAPI appAPI;
  LoginState state = LoginState();

  Future<Response<CredencialDTO>> _getData(AuthAPIApi authAPIApi) async {
    try {
      var dado = await authAPIApi.getInfoByToken(authorization: appAPI.config.token.value);
      debugPrint("home-page:data:$dado");
      return dado;
    } on DioException catch (e) {
      debugPrint("Erro home:"+e.response.toString());
      return Future.value([] as FutureOr<Response<CredencialDTO>>?);
    }
  }

  void sair() {
    appAPI.config.token.set("null");
    Routefly.navigate(routePaths.login);
  }

  @override
  Widget build(BuildContext context) {
    appAPI = context.read<AppAPI>();
    AuthAPIApi? authApi = context.read<AppAPI>().api.getAuthAPIApi();
    if(appAPI.config.token.get() == "null" || 
      appAPI.config.token.get() == "") Routefly.navigate(routePaths.login);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Minha conta'),
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
      body: FutureBuilder<Response<CredencialDTO>>(
          future: _getData(authApi),
          builder:
              (context, AsyncSnapshot<Response<CredencialDTO>> snapshot) {
            return buildView(snapshot);
          }),
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
              icon: Icon(Icons.contacts),
              label: "Contatos"
          ),
        ],
      ),
    );
  }

  validateForm(BuildContext context) async {
    print("object");
  }

  Widget buildView(AsyncSnapshot<Response<CredencialDTO>> snapshot) {
    if (snapshot.hasData) {
      return SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                height: MediaQuery.of(context).size.height - 120,
                //height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Flexible(
                      flex: 6,
                      child: Text(
                        "Nome: ${snapshot.data!.data!.nome}",
                        style: TextStyle(fontSize: 20, height: 3),
                        ),
                    ),
                    Flexible(
                      flex: 6,
                      child: Text(
                        "Email: ${snapshot.data!.data!.email}",
                        style: TextStyle(fontSize: 20),
                        ),
                    ),
                    const Spacer(
                      flex: 1
                    ),
                    Flexible(
                      flex: 3,
                      child: FractionallySizedBox(
                        widthFactor: 0.5,
                        heightFactor: 0.3,
                        child: FilledButton(
                          onPressed: () => {validateForm(context)},
                          child: const Text('Alterar senha'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
    } else if (snapshot.hasError) {
      return Text('Erro ao acessar dados. Favor refazer login!');
    } else {
      return CircularProgressIndicator();
    }
  }

  void onTabTapped(int index) {
    if(index==0) Routefly.navigate(routePaths.home);
    if(index==1) Routefly.navigate(routePaths.conta);
    if(index==2) Routefly.navigate(routePaths.contato);
  }
}