import 'package:app_gestao_de_tarefas/app/core/ui/helper/loader.dart';
import 'package:mobx/mobx.dart';
part 'default_store.g.dart';

class DefaultStore = DefaultStoreBase with _$DefaultStore;

abstract class DefaultStoreBase with Store {
  @observable
  LoaderStatus statusLoader = LoaderStatus.initial;

  @action
  void showLoader() {
    statusLoader = LoaderStatus.loading;
  }

  @action
  void hideLoader() {
    statusLoader = LoaderStatus.dispose;
  }
}
