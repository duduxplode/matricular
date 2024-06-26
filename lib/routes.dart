import 'package:routefly/routefly.dart';

import 'app/conta/conta_page.dart' as a0;
import 'app/contato/contato_page.dart' as a1;
import 'app/funcionario/[id]_page.dart' as a4;
import 'app/funcionario/form_funcionario_page.dart' as a2;
import 'app/funcionario/list_funcionario_page.dart' as a3;
import 'app/home/home_page.dart' as a5;
import 'app/login/login_page.dart' as a6;
import 'app/login_form/login_form_page.dart' as a7;
import 'app/matricula/list_matricula_page.dart' as a8;
import 'app/prefs/prefs_page.dart' as a9;
import 'app/matricula/[id]_page.dart' as a10;

List<RouteEntity> get routes => [
  RouteEntity(
    key: '/conta',
    uri: Uri.parse('/conta'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a0.StartPage(),
    ),
  ),
  RouteEntity(
    key: '/contato',
    uri: Uri.parse('/contato'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a1.StartPage(),
    ),
  ),
  RouteEntity(
    key: '/funcionario/form_funcionario',
    uri: Uri.parse('/funcionario/form_funcionario'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a2.StartPage(),
    ),
  ),
  RouteEntity(
    key: '/funcionario/list_funcionario',
    uri: Uri.parse('/funcionario/list_funcionario'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a3.StartPage(),
    ),
  ),
  RouteEntity(
    key: '/funcionario/[id]',
    uri: Uri.parse('/funcionario/[id]'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a4.StartPage(),
    ),
  ),
  RouteEntity(
    key: '/home',
    uri: Uri.parse('/home'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a5.HomePage(),
    ),
  ),
  RouteEntity(
    key: '/login',
    uri: Uri.parse('/login'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a6.LoginPage(),
    ),
  ),
  RouteEntity(
    key: '/login_form',
    uri: Uri.parse('/login_form'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a7.LoginPage(),
    ),
  ),
  RouteEntity(
    key: '/matricula/list_matricula',
    uri: Uri.parse('/matricula/list_matricula'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a8.StartPage(),
    ),
  ),
  RouteEntity(
    key: '/matricula/[id]',
    uri: Uri.parse('/matricula/[id]'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a10.StartPage(),
    ),
  ),
  RouteEntity(
    key: '/prefs',
    uri: Uri.parse('/prefs'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a9.PrefsPage(),
    ),
  ),
];

const routePaths = (
  path: '/',
  conta: '/conta',
  contato: '/contato',
  funcionario: (
    path: '/funcionario',
    formFuncionario: '/funcionario/form_funcionario',
    listFuncionario: '/funcionario/list_funcionario',
    $id: '/funcionario/[id]',
  ),
  home: '/home',
  login: '/login',
  loginForm: '/login_form',
  matricula: (
    path: '/matricula',
    listMatricula: '/matricula/list_matricula',
    $id: '/matricula/[id]',
  ),
  prefs: '/prefs',
);
