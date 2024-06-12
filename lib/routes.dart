import 'package:routefly/routefly.dart';

import 'app/home/home_page.dart' as a0;
import 'app/login/login_page.dart' as a1;
import 'app/login_form/login_form_page.dart' as a2;
import 'app/prefs/prefs_page.dart' as a3;
import 'app/matricula/list_matricula_page.dart' as a4;
import 'app/conta/conta_page.dart' as a5;
import 'app/contato/contato_page.dart' as a6;
import 'app/funcionario/list_funcionario.dart' as a7;
import 'app/funcionario/form_funcionario.dart' as a8;

List<RouteEntity> get routes => [
  RouteEntity(
    key: '/home',
    uri: Uri.parse('/home'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a0.HomePage(),
    ),
  ),
  RouteEntity(
    key: '/login',
    uri: Uri.parse('/login'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a1.LoginPage(),
    ),
  ),
  RouteEntity(
    key: '/login_form',
    uri: Uri.parse('/login_form'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a2.LoginPage(),
    ),
  ),
  RouteEntity(
    key: '/prefs',
    uri: Uri.parse('/prefs'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a3.PrefsPage(),
    ),
  ),
  RouteEntity(
    key: '/matricula',
    uri: Uri.parse('/matricula'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a4.StartPage(),
    ),
  ),
  RouteEntity(
    key: '/conta',
    uri: Uri.parse('/conta'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a5.StartPage(),
    ),
  ),
  RouteEntity(
    key: '/contato',
    uri: Uri.parse('/contato'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a6.StartPage(),
    ),
  ),
  RouteEntity(
    key: '/listfuncionario',
    uri: Uri.parse('/list_funcionario'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a7.StartPage(),
    ),
  ),
  RouteEntity(
    key: '/funcionario',
    uri: Uri.parse('/funcionario'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a8.StartPage(),
    ),
  ),
];

const routePaths = (
  path: '/',
  home: '/home',
  login: '/login',
  loginForm: '/login_form',
  prefs: '/prefs',
  matricula: '/matricula',
  conta: '/conta',
  contato: '/contato',
  funcionario: '/funcionario',
  listfuncionario: '/list_funcionario'
);