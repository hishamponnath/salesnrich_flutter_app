import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:salesnrich_app_flutter/api/api.dart';
import 'package:salesnrich_app_flutter/model/territoriesmodel.dart';

import 'package:shared_preferences/shared_preferences.dart';

class TerritoryService {
  final Client = http.Client();

  Future<List<TerritoryModel>?> getAllTerritories() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<TerritoryModel> territoryList = [];
    final token = pref.getString('token');

    if (kDebugMode) {
      print(token);
    }

    try {
      final response = await Client.get(
        Uri.parse("${API().baseUrl}${API().territoriesUrl}"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        for (var element in responseBody) {
          var territoryModel = TerritoryModel.fromJson(element);
          territoryList.add(territoryModel);
          if (kDebugMode) {
            print(territoryModel);
          }
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("Error fetching territories: $e");
      }
    }
    return territoryList;
  }
}
