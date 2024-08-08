abstract class DataService {
  Future<dynamic> get({required route});
  Future<dynamic> post({required String route, required Map<String, dynamic> data});
}
