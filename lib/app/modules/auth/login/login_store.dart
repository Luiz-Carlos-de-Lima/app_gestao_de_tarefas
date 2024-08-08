import 'package:app_gestao_de_tarefas/app/core/stores/default_store.dart';
import 'package:app_gestao_de_tarefas/app/services/user/user_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../repositories/user/user_repository.dart';
part 'login_store.g.dart';

class LoginStore = LoginStoreBase with _$LoginStore;

abstract class LoginStoreBase extends DefaultStore with Store {
  final userRepository = Modular.get<UserRepository>();
  final userService = Modular.get<UserService>();

  Future<void> login({required String email, required String password}) async {
    await userService.login(email: email, password: password);
  }

  Future<void> recoverPassword({required String email}) async {
    await userService.recoverPassword(email: email);
  }
}
