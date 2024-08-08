import 'dart:developer';

import 'package:app_gestao_de_tarefas/app/core/constants/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FirebaseListener {
  final FirebaseAuth _firebaseAuth;

  FirebaseListener({required FirebaseAuth firebaseAuth}) : _firebaseAuth = firebaseAuth;

  void loadListerner() {
    _firebaseAuth.idTokenChanges().listen((user) {
      if (user != null) {
        log('Logged');
        Modular.to.pushNamedAndRemoveUntil(Routers.home, (route) => false);
      } else {
        log('Logout');
        Modular.to.pushNamedAndRemoveUntil(Routers.login, (route) => false);
      }
    });
  }
}
