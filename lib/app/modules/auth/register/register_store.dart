import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../repositories/user/user_repository_impl.dart';
import '../../../services/user/user_service_impl.dart';
part 'register_store.g.dart';

class RegisterStore = RegisterStoreBase with _$RegisterStore;

abstract class RegisterStoreBase with Store {
  final userRepository = Modular.get<UserRepositoryImpl>();
  final userService = Modular.get<UserServiceImpl>();

  Future<void> register({required String email, required String password}) async {
    await userService.register(email: email, password: password);
  }
}
