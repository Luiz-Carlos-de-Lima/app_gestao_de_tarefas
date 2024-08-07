import 'package:firebase_auth/firebase_auth.dart';

abstract class UserRepository {
  Future<User?> login({required String email, required String password});
  Future<User?> register({required String email, required String password});
  Future<void> recoverPassword({required String email});
  Future<void> logout();
}
