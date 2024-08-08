import 'package:app_gestao_de_tarefas/app/modules/splash/splash_module.dart';
import 'package:app_gestao_de_tarefas/app/repositories/user/user_repository_impl.dart';
import 'package:app_gestao_de_tarefas/app/services/user/user_service_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.addSingleton(() => UserRepositoryImpl(firebaseAuth: FirebaseAuth.instance));
    i.addSingleton(() => UserServiceImpl(repository: i.get<UserRepositoryImpl>()));
  }

  @override
  void routes(r) {
    r.module('/', module: SplashModule());
  }
}
