import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';

import '../../core/exceptions/auth_exception.dart';
import 'user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final FirebaseAuth _firebaseAuth;

  const UserRepositoryImpl({required FirebaseAuth firebaseAuth}) : _firebaseAuth = firebaseAuth;

  @override
  Future<User?> register({required String email, required String password}) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);

      return userCredential.user;
    } on FirebaseAuthException catch (e, s) {
      log(e.toString());
      log(s.toString());

      if (e.code == 'email-already-in-use') {
        throw AuthException(message: 'E-mail já utillizado, por favor escolha outro e-mail.');
      } else {
        throw AuthException(message: e.message ?? 'Erro ao registrar usuário');
      }
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      throw AuthException(message: 'Erro ao registrar usuário');
    }
  }

  @override
  Future<User?> login({required String email, required String password}) async {
    try {
      final user = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);

      return user.user;
    } on FirebaseAuthException catch (e, s) {
      log(e.toString());
      log(s.toString());

      if (e.code == 'invalid-credential') {
        throw AuthException(message: 'Erro ao fazer o login, Verifique e-mail e senha e tente novamente');
      } else {
        throw AuthException(message: 'Erro ao fazer o login');
      }
    } catch (e, s) {
      log(e.toString());
      log(s.toString());
      throw AuthException(message: 'Erro ao fazer o login usuário');
    }
  }

  @override
  Future<void> recoverPassword({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e, s) {
      log(e.toString());
      log(s.toString());

      if (e.code == 'user-not-found') {
        throw AuthException(message: 'Usuário não encontrado, Para continuar cadastre-se');
      } else if (e.code == 'invalid-email') {
        throw AuthException(message: 'Digite um e-mail válido para continuar.');
      } else {
        throw AuthException(message: 'Erro ao tentar fazer a solicitação para trocar a senha.');
      }
    }
  }

  @override
  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }
}
