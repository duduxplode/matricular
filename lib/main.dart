import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:matricular/matricular.dart';
import 'package:matricularApp/app/api/AppAPI.dart';
import 'package:matricularApp/app/utils/config_state.dart';
import 'package:matricularApp/app/utils/security-store.dart';
import 'package:provider/provider.dart';
import 'package:routefly/routefly.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'pages/login-form/login_form_page.dart';
//import 'app/login/login_page.dart';
import 'routes.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final storage = SecurityStore();

  final state = ConfigState(prefs: storage);

  final appAPI = AppAPI(config: state);
  
  runApp(
    MultiProvider(
        providers: [
          Provider(create: (_) => state,
          dispose: (_, instance) => instance.dispose() ,),
          Provider(create: (_) => appAPI,
  dispose: (_, instance) => instance.dispose(),)
        ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: Routefly.routerConfig(
        routes: routes, // GENERATED
        initialPath: routePaths.login,
        routeBuilder: (context, settings, child) {
          return MaterialPageRoute(
            settings: settings, // !! IMPORTANT !!
            builder: (context) => child,
          
          );
        },
      ),
      debugShowCheckedModeBanner: false,

      title: 'MatricuLAR',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home:  LoginPage(title: "Sistema exemplo"),
    );
  }
}

