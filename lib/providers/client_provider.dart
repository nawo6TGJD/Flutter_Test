import 'package:flutter/material.dart';
import '../models/client.dart';
import '../services/api_service.dart';

class ClientProvider extends ChangeNotifier {
  final ApiService _api = ApiService();

  List<Client> clients = [];
  bool isLoading = false;

  Future<void> searchClient(String nic) async {
    isLoading = true;
    notifyListeners();
    try {
      final res = await _api.getClientByNIC(nic);
      if (res.statusCode == 200 && res.data is List) {
        clients = (res.data as List)
            .map((json) => Client.fromJson(json))
            .toList();
      }
    } catch (e) {
      print("Error: $e");
    }
    isLoading = false;
    notifyListeners();
  }

  Future<bool> saveClientVisit(Client client) async {
    try {
      final res = await _api.saveClientVisit(client.toJson());
      return res.statusCode == 200;
    } catch (e) {
      print("Save error: $e");
      return false;
    }
  }
}
