import 'package:test2/model/user_model.dart';
import 'package:test2/network/api_provider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<List<UserModel>> getUsers() {
    return _provider.fetchUsers();
  }
}
