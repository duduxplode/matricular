import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:matricular/matricular.dart';
import 'package:matricularApp/app/api/AppAPI.dart';
import 'package:matricularApp/app/utils/config_state.dart';
import 'package:matricularApp/routes.dart';
import 'package:provider/provider.dart';
import 'package:routefly/routefly.dart';
import 'package:signals/signals.dart';
import 'package:signals/signals_flutter.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute(
      fullscreenDialog: true,
      builder: (context) => MultiProvider(
        providers: [
          Provider(create: (_) => context.read<ConfigState>(),
            dispose: (_, instance) => instance.dispose() ,),
          Provider(create: (_) => context.read<AppAPI>())
        ],
        child: const StartPage(),
      )
    );
  }

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  Signal refresh = Signal("");
  Future<Response<BuiltList<UsuarioDTO>>> _getData(UsuarioControllerApi usuarioControllerApi, String refresh) async {
    try {
      var dado = await usuarioControllerApi.usuarioControllerListAll();
      debugPrint("home-page:data:$dado");
      return dado;
    } on DioException catch (e) {
      debugPrint("Erro home:"+e.response.toString());
      return Future.value([] as FutureOr<Response<BuiltList<UsuarioDTO>>>?);
    }
  }

  @override
  Widget build(BuildContext context) {
    UsuarioControllerApi? usuarioControllerApi = context.read<AppAPI>().api.getUsuarioControllerApi();
    debugPrint("home-page-tipoApi:$usuarioControllerApi");
    debugPrint("Build Home page funcionario");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Funcionários '),
      ),
      body: ListenableBuilder(
        listenable: Routefly.listenable,
        builder: (context,snapshot) {
          return FutureBuilder<Response<BuiltList<UsuarioDTO>>>(
            future: _getData(usuarioControllerApi, refresh.watch(context)),
            builder:
                (context, AsyncSnapshot<Response<BuiltList<UsuarioDTO>>> snapshot) {
              return buildListView(snapshot);
            });}
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
              icon: Icon(Icons.add),
              label: "Novo"
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    if(index==0) Routefly.navigate(routePaths.home);
    if(index==1) Routefly.navigate(routePaths.conta);
    if(index==2) Routefly.navigate(routePaths.funcionario.formFuncionario);
  }

  Widget buildListView(AsyncSnapshot<Response<BuiltList<UsuarioDTO>>> snapshot) {
    if (snapshot.hasData) {
      return ListView.builder(
        itemCount: snapshot.data?.data?.length,
        itemBuilder: (BuildContext context, int index) {
          debugPrint("Index:${index}");
          return Center(
              child: Container(
                //height: 100,
                //width: 200,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  color: Color.fromARGB(255, 238, 238, 116).withAlpha(80),
                  elevation: 10,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.account_box, size: 60),
                        title: Text("Código: ${snapshot.data!.data?[index].id}",
                            style: TextStyle(fontSize: 22.0)),
                        subtitle: Text(
                            "Nome: ${snapshot.data!.data?[index].pessoaNome} CPF: ${snapshot.data!.data?[index].pessoaCpf}",
                            style: TextStyle(fontSize: 18.0)),
                      ),
                      ButtonBar(
                        children: <Widget>[
                          ElevatedButton(
                            child: const Text('Editar'),
                            onPressed: () async {
                              editarUsuario(snapshot, index);
                            },
                          ),
                          ElevatedButton(
                            child: const Text('Excluir'),
                            onPressed: () async {
                              excluirUsuario(context, snapshot, index);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ));
        },
      );
    } else if (snapshot.hasError) {
      return Text('Erro ao acessar dados. Favor refazer login!');
    } else {
      return CircularProgressIndicator();
    }
  }

  Text buildItemList(
      AsyncSnapshot<Response<BuiltList<UsuarioDTO>>> snapshot, int index) {
    debugPrint("coisa");
    debugPrint(snapshot.data.toString());
    return Text("id:${snapshot.data!.data?[index]}");
  }
  
  excluirUsuario(BuildContext context, AsyncSnapshot<Response<BuiltList<UsuarioDTO>>> snapshot, int index) async {
    UsuarioControllerApi? usuarioControllerApi = context.read<AppAPI>().api.getUsuarioControllerApi();
    int id = snapshot.data!.data![index].id!;
    debugPrint(id.toString());
    await usuarioControllerApi.usuarioControllerRemover(id: id);
    refresh.set(id.toString());
  }
  
  editarUsuario(AsyncSnapshot<Response<BuiltList<UsuarioDTO>>> snapshot, int index) {
    Routefly.pushNavigate(routePaths.funcionario.path + "/" + snapshot.data!.data![index].id!.toString());
  }

}