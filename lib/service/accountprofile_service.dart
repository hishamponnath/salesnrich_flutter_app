import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:salesnrich_app_flutter/api/api.dart';
import 'package:salesnrich_app_flutter/model/accountprofilemodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountprofileService {
  final Client = http.Client();

  Future<List<AccountProfileModel>> getAccountProfiles(int page) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<AccountProfileModel> accountprofileList = [];
    final token = pref.get('token');
    if (kDebugMode) {
      print(token);
    }
    try {
      final response = await http.get(
        Uri.parse(
            "${API().baseUrl}${API().accountprofileUrl}?page=$page&size=50"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);

        for (var element in responseBody) {
          var accountProfileModel = AccountProfileModel.fromJson(element);
          accountprofileList.add(accountProfileModel);
          if (kDebugMode) {
            print(accountProfileModel);
          }
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("$e");
      }
    }
    return accountprofileList;
  }
}
