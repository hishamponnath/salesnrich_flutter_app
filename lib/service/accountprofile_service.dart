import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:salesnrich_app_flutter/api/api.dart';
import 'package:salesnrich_app_flutter/model/accountprofilemodel.dart';
import 'package:salesnrich_app_flutter/model/usermodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountprofileService {
  final Client = http.Client();

  Future<List<AccountProfileModel>> getallaccountprofiles() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<AccountProfileModel> accountprofileList = [];
    final token = pref.get('token');
    if (kDebugMode) {
      print(token);
    }
    try {
      for (int i = 0; i <= 100; i++) {
        final resposnse = await http.get(
          Uri.parse(
              "${API().baseUrl}${API().accountprofileUrl}?page=$i&size=1000"),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          },
        );
        if (resposnse.statusCode == 200) {
          final responseBody = jsonDecode(resposnse.body);

          for (var element in responseBody) {
            var accountProfileModel = AccountProfileModel.fromJson(element);
            accountprofileList.add(accountProfileModel);
            if (kDebugMode) {
              print(accountProfileModel);
            }
          }
          if (accountprofileList.length <= 1000) {
            break;
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
