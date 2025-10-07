import 'package:dio/dio.dart';
import '../utils/constants.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(baseUrl: baseUrl));

  Future<Response> login(String username, String password) {
    return _dio.post('/api/auth/login', data: {
      "username": username,
      "password": password,
    });
  }

  Future<Response> getClientByNIC(String nic) {
    return _dio.post('/api/c1ient-visit/getByNIC', data: {"clientNIC": nic});
  }

  Future<Response> saveClientVisit(Map<String, dynamic> data) {
    return _dio.post('/api/client-visit/save', data: data);
  }
}
