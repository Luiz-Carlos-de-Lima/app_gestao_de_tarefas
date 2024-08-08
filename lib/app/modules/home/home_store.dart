import 'package:app_gestao_de_tarefas/app/core/stores/default_store.dart';
import 'package:mobx/mobx.dart';
part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase extends DefaultStore with Store {}
