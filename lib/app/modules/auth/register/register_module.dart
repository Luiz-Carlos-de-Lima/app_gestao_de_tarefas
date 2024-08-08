import 'package:app_gestao_de_tarefas/app/modules/auth/register/register_page.dart';
import 'package:app_gestao_de_tarefas/app/modules/auth/register/register_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton(RegisterStore.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const RegisterPage());
  }
}
