import 'package:app_gestao_de_tarefas/app/core/constants/routes.dart';
import 'package:app_gestao_de_tarefas/app/modules/auth/login/login_module.dart';
import 'package:app_gestao_de_tarefas/app/modules/splash/splash_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashModule extends Module {
  @override
  void routes(r) {
    r.child('/', child: (contex) => const SplashPage());
    r.module(Routers.login, module: LoginModule());
  }
}
