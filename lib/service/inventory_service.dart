import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:salesnrich_app_flutter/api/api.dart';
import 'package:salesnrich_app_flutter/model/inventorymodel.dart';

import 'package:shared_preferences/shared_preferences.dart';

class InventoryService {
  final client = http.Client();

  Future<List<inventorymodel>> getAllInventory() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    final token = pref.get('token');
    List<inventorymodel> inventory = [];
    if (kDebugMode) {
      print(token);
    }
    try {
      final resposnse = await client.get(
        Uri.parse("${API().baseUrl}${API().inventoryUrl}?page=0&size=500"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (resposnse.statusCode == 200) {
        final responseBody = jsonDecode(resposnse.body);

        for (var element in responseBody) {
          inventory.add(inventorymodel.fromJson(element));
          if (kDebugMode) {
            print(inventorymodel);
          }
        }

        return inventory;
      }

      return inventory;
    } catch (e) {
      if (kDebugMode) {
        print("$e");
      }
    }

    return inventory;
  }
}
