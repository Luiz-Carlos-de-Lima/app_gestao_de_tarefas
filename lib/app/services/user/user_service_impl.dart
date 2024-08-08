import 'package:app_gestao_de_tarefas/app/repositories/user/user_repository.dart';
import 'package:app_gestao_de_tarefas/app/services/user/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserServiceImpl implements UserService {
  final UserRepository _repository;

  UserServiceImpl({required UserRepository repository}) : _repository = repository;

  @override
  Future<User?> login({required String email, required String password}) async {
    return await _repository.login(email: email, password: password);
  }

  @override
  Future<User?> register({required String email, required String password}) async {
    return await _repository.register(email: email, password: password);
  }

  @override
  Future<void> recoverPassword({required String email}) async {
    await _repository.recoverPassword(email: email);
  }

  @override
  Future<void> logout() async {
    await _repository.logout();
  }
}
