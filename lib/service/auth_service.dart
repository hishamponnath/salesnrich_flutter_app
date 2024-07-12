import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart%20';
import 'package:salesnrich_app_flutter/api/api.dart';
import 'package:salesnrich_app_flutter/model/usermodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final Client = http.Client();
  Future<UserModel?> login(String username, String password) async {
    final Map<String, dynamic> body = {
      'username': username,
      'password': password
    };
try{
  final response =await Client.post(Uri.parse("${API().baseUrl}${API().authUrl}"),
  headers: {'Content-Type':'application/json'},
  body: jsonEncode(body)
  );
  if (response.statusCode==200){
//
//
//not completed
//
//
  }
}
catch(error){
  print("$error");
}
  }
}
