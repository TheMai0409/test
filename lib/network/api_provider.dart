import 'package:dio/dio.dart';
import 'package:test2/model/user_model.dart';

class ApiProvider {
  final Dio _dio = Dio();

  final String url = "https://jsonplaceholder.typicode.com/posts";

  Future<List<UserModel>> fetchUsers() async {
    List<UserModel> list = [];
    Response response = await _dio.get(url);
    list = response.data
        .map((e) => UserModel.fromJson(e))
        .toList()
        .cast<UserModel>();
    return list;
  }
}
