import 'package:app_gestao_de_tarefas/app/repositories/user/user_repository_impl.dart';
import 'package:app_gestao_de_tarefas/app/services/user/user_service_impl.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'login_store.g.dart';

class LoginStore = LoginStoreBase with _$LoginStore;

abstract class LoginStoreBase with Store {
  final userRepository = Modular.get<UserRepositoryImpl>();
  final userService = Modular.get<UserServiceImpl>();

  @readonly
  bool _isLogged = false;

  Future<void> login({required String email, required String password}) async {
    User? user = await userService.login(email: email, password: password);

    if (user != null) {
      _isLogged = true;
    }
  }
}
