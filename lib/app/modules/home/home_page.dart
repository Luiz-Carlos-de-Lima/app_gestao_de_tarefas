import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../services/user/user_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Text('Home Page'),
              ElevatedButton(
                onPressed: () {
                  Modular.get<UserService>().logout();
                },
                child: Text('Logout'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
