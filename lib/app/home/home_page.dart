import 'package:flutter/material.dart';
import 'package:matricular/matricular.dart';
import 'package:routefly/routefly.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:signals/signals_flutter.dart';


class HomePage extends StatefulWidget {
  

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<String> login() async {
    final prefs = await SharedPreferences.getInstance();
    print(prefs.getString('token'));
    return 'Inicio';
  }

  @override
  Widget build(BuildContext context) {
    login();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Home da aplicação'),
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
              Flexible(
                flex: 3,
                child: FractionallySizedBox(
                  widthFactor: 0.4,
                  heightFactor: 0.4,
                  child: FilledButton(
                    onPressed: () {
                      Routefly.pop(context);
                    },
                    child: const Text('voltar'),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}