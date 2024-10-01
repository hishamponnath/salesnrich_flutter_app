import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:salesnrich_app_flutter/api/api.dart';
import 'package:salesnrich_app_flutter/model/sundrymodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SundryService {
  final Client = http.Client();

  Future<List<SundryModel>?> getAllSundry() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<SundryModel> sundry = [];
    final token = pref.getString('token');
    try {
      final response = await Client.get(
          Uri.parse("${API().baseUrl}${API().sundryUrl}"),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          });

      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);
        sundry.add(SundryModel.fromJson(responseBody[0]));
      }
    } catch (e) {
      if (kDebugMode) {
        print("$e");
      }
    }
    return sundry;
  }
}
