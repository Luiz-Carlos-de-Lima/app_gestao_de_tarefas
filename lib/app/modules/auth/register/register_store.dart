import 'package:app_gestao_de_tarefas/app/core/stores/default_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../repositories/user/user_repository.dart';
import '../../../services/user/user_service.dart';
part 'register_store.g.dart';

class RegisterStore = RegisterStoreBase with _$RegisterStore;

abstract class RegisterStoreBase extends DefaultStore with Store {
  final userRepository = Modular.get<UserRepository>();
  final userService = Modular.get<UserService>();

  Future<void> register({required String email, required String password}) async {
    await userService.register(email: email, password: password);
  }
}
