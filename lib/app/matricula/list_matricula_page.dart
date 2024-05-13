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

class StartPage extends StatelessWidget {
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

  Future<Response<BuiltList<MatriculaDTO>>> _getData(MatriculaControllerApi matriculaControllerApi) async {
    try {
      var dado = await matriculaControllerApi.matriculaControllerListAll();
      debugPrint("home-page:data:$dado");
      return dado;
    } on DioException catch (e) {
      debugPrint("Erro home:"+e.response.toString());
      return Future.value([] as FutureOr<Response<BuiltList<MatriculaDTO>>>?);
    }
  }

  @override
  Widget build(BuildContext context) {
    MatriculaControllerApi? matriculaControllerApi = context.read<AppAPI>().api.getMatriculaControllerApi();
    debugPrint("home-page-tipoApi:$matriculaControllerApi");
    debugPrint("Build Home page matricula");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Tela de matrículas '),
      ),
      body: FutureBuilder<Response<BuiltList<MatriculaDTO>>>(
          future: _getData(matriculaControllerApi),
          builder:
              (context, AsyncSnapshot<Response<BuiltList<MatriculaDTO>>> snapshot) {
            return buildListView(snapshot);
          }),
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
              icon: Icon(Icons.contacts),
              label: "Contatos"
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    if(index==0) Routefly.navigate(routePaths.home);
  }

  Widget buildListView(AsyncSnapshot<Response<BuiltList<MatriculaDTO>>> snapshot) {
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
                        title: Text("id:${snapshot.data!.data?[index].id}",
                            style: TextStyle(fontSize: 22.0)),
                        subtitle: Text(
                            "status:${snapshot.data!.data?[index].status} criança:${snapshot.data!.data?[index].nome}",
                            style: TextStyle(fontSize: 18.0)),
                      ),
                      ButtonBar(
                        children: <Widget>[
                          ElevatedButton(
                            child: const Text('Detalhar'),
                            onPressed: () {
                              /* ... */
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
      if(snapshot.data?.statusCode == 403)
        return Text('Erro ao acessar dados. Favor fazer login novamente!');
      return Text('Erro ao acessar dados');
    } else {
      return CircularProgressIndicator();
    }
  }

  Text buildItemList(
      AsyncSnapshot<Response<BuiltList<MatriculaDTO>>> snapshot, int index) {
    debugPrint("coisa");
    debugPrint(snapshot.data.toString());
    return Text("id:${snapshot.data!.data?[index]}");
  }

}