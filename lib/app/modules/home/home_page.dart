import 'package:app_gestao_de_tarefas/app/core/ui/extensions/theme_extension.dart';
import 'package:app_gestao_de_tarefas/app/models/task.dart';
import 'package:app_gestao_de_tarefas/app/modules/home/home_store.dart';
import 'package:app_gestao_de_tarefas/app/services/user/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _store = Modular.get<HomeStore>();

  @override
  void initState() {
    _store.getListTask();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () async {
                  await Modular.get<UserService>().logout();
                },
                icon: const Icon(Icons.logout_rounded))
          ],
        ),
        body: Center(
          child: Observer(builder: (context) {
            if (_store.listTask.isEmpty) {
              return SingleChildScrollView(
                  child: Column(
                children: [
                  Image.asset(
                    'assets/images/checklist.png',
                  ),
                  Text(
                    'Nenhuma tarefa encontrada',
                    style: TextStyle(color: context.onBackground, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'para adicionar clique no botão +',
                    style: TextStyle(color: context.onBackground),
                  ),
                ],
              ));
            } else {
              return ListView.builder(
                itemCount: _store.listTask.length,
                itemBuilder: (context, index) => Container(
                  child: Column(
                    children: [
                      Text(_store.listTask[index].title),
                      Text(_store.listTask[index].description),
                    ],
                  ),
                ),
              );
            }
          }),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            final task = Task(title: 'Teste', description: 'Teste para verificar se está sendo add a tarefa');
            _store.addNewTask(newTask: task);
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
