import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:salesnrich_app_flutter/api/api.dart';
import 'package:salesnrich_app_flutter/model/menuitemsmodel.dart';

import 'package:shared_preferences/shared_preferences.dart';

class MenuitemsService {
  final Client = http.Client();

  Future<List<Menuitems>?> getAllMenuItems() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<Menuitems> menuItemsList = [];
    final token = pref.get('token');
    if (kDebugMode) {
      print(token);
    }
    try {
      final response = await Client.get(
        Uri.parse("${API().baseUrl}${API().drawerUrl}"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        for (var element in responseBody) {
          var menuItem = Menuitems.fromJson(element);
          menuItemsList.add(menuItem);
          if (kDebugMode) {
            print(menuItem);
          }
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("$e");
      }
    }
    return menuItemsList;
  }
}
