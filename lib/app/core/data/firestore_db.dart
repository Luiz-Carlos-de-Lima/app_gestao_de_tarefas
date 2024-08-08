import 'package:app_gestao_de_tarefas/app/core/data/data_service.dart';
import 'package:app_gestao_de_tarefas/app/core/exceptions/data_service_exception.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDb implements DataService {
  final FirebaseFirestore _db;

  FirestoreDb({required FirebaseFirestore db}) : _db = db;

  @override
  Future get({required route}) async {
    try {
      QuerySnapshot<Map<String, dynamic>> collection = await _db.collection(route).get();
      final list = collection.docs.map((e) => {'title': e['title'], 'description': e['description'], 'status': e['status']}).toList();
      return list;
    } catch (e) {
      throw DataServiceException(message: 'Ocorreu um erro ao obter os dados solicitados.');
    }
  }

  @override
  Future post({required String route, required Map<String, dynamic> data}) async {
    DocumentReference document = await _db.collection(route).add(data);
  }
}
