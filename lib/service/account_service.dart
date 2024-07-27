import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:salesnrich_app_flutter/api/api.dart';
import 'package:salesnrich_app_flutter/model/accountmodel.dart';

class AccountService {
  final http.Client client = http.Client();

  Future<List<AccountModel>> getAccount() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<AccountModel> accountList = [];
    final token = pref.get('token');
    if (kDebugMode) {
      print(token);
    }
    try {
      final response = await client.get(
        Uri.parse("${API().baseUrl}${API().accountUrl}"),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);

        for (var element in responseBody) {
          var accountModel = AccountModel.fromJson(element);
          accountList.add(accountModel);
          if (kDebugMode) {
            print(accountModel);
          }
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("$e");
      }
    }
    return accountList;
  }
}
