import 'package:app_gestao_de_tarefas/app/core/ui/todo_list_ui_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      locale: const Locale('pt', 'BR'),
      title: 'App Gestao de tarefas',
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      theme: TodoListUiConfig.theme,
      routerConfig: Modular.routerConfig,
    );
  }
}
