import 'package:flutter/material.dart';
import '../services/api_service.dart';

class AuthProvider extends ChangeNotifier {
  final ApiService _api = ApiService();

  bool isLoading = false;
  bool isLoggedIn = false;

  Future<bool> login(String username, String password) async {
    isLoading = true;
    notifyListeners();

    try {
      final response = await _api.login(username, password);
      if (response.statusCode == 200) {
        isLoggedIn = true;
        isLoading = false;
        notifyListeners();
        return true;
      }
    } catch (e) {
      print("Login error: $e");
    }

    isLoading = false;
    notifyListeners();
    return false;
  }
}
