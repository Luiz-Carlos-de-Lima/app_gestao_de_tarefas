import 'package:app_gestao_de_tarefas/app/core/constants/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../core/widgets/todo_list_logo.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final firebase = FirebaseAuth.instance;
      if (firebase.currentUser != null) {
        Modular.to.pushReplacementNamed(Routers.home);
      } else {
        Modular.to.pushReplacementNamed(Routers.login);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LogoWidget(
              text: 'Todo List',
            ),
          ],
        ),
      ),
    );
  }
}
