import 'package:app_gestao_de_tarefas/app/modules/home/home_page.dart';
import 'package:app_gestao_de_tarefas/app/modules/home/home_store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_modular/flutter_modular.dart';

import '../../core/data/data_service.dart';
import '../../core/data/firestore_db.dart';
import '../../repositories/task/task_repository.dart';
import '../../repositories/task/task_repository_impl.dart';
import '../../services/task/task_service.dart';
import '../../services/task/task_service_impl.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton(HomeStore.new);
    i.addLazySingleton<DataService>(() => FirestoreDb(db: FirebaseFirestore.instance));
    i.addLazySingleton<TaskRepository>(() => TaskRepositoryImpl(dataService: i.get<DataService>()));
    i.addLazySingleton<TaskService>(() => TaskServiceImpl(repository: i.get<TaskRepository>()));
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (context) => const HomePage());
  }
}
