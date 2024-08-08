import 'package:app_gestao_de_tarefas/app/core/constants/routes.dart';
import 'package:app_gestao_de_tarefas/app/modules/auth/login/login_page.dart';
import 'package:app_gestao_de_tarefas/app/modules/auth/login/login_store.dart';
import 'package:app_gestao_de_tarefas/app/modules/auth/register/register_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton(LoginStore.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const LoginPage());
    r.module(Routers.register, module: RegisterModule());
  }
}
