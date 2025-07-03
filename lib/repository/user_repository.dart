import 'package:devmov_tarefa_floor/repository/response_data.dart';
import 'package:devmov_tarefa_floor/repository/user_data.dart';
import 'package:dio/dio.dart';

class UserRepository {

  static const _BASE_URL = "http://10.0.2.2:3001";
  static const _TO_TEST_URL = "http://localhost:3001";

  late final Dio _dio;

  UserRepository([bool test = false]) {
    if (test) {
      _dio = Dio(BaseOptions(baseUrl: _TO_TEST_URL));
    } else {
      _dio = Dio(BaseOptions(baseUrl: _BASE_URL));
    }
  }

  Future<String> login(String name, String age) async {
    try {
      final userData = UserData(name: name, age: age);
      final response = await _dio.post(
        '/login',
        data: userData.toJson()
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final responseData = ResponseData.fromJson(response.data);
        if (responseData.message == 'success') {
          return 'success';
        } else if (responseData.message == 'unexisting user') {
          return 'wrong_user';
        } else if (responseData.message == 'wrong age') {
          return 'wrong_age';
        } else {
          return responseData.message;
        }
      } else {
        throw Exception('failed status code');
      }
    } catch(e) {
      print(e);
      return 'failed_connection';
    }
  }
}