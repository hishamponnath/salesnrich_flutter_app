import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:salesnrich_app_flutter/api/api.dart';
import 'package:salesnrich_app_flutter/model/usermodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final http.Client _client = http.Client();

  Future<UserModel?> login(String username, String password) async {
    final Map<String, dynamic> body = {
      'username': username,
      'password': password
    };

    try {
      final Uri url = Uri.parse("${API().baseUrl}${API().authUrl}");
      final response = await _client.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        final UserModel user = UserModel.fromJson(result);
        SharedPreferences _pref = await SharedPreferences.getInstance();
        _pref.setString('token', user.idToken.toString());
        return user;
      } else {
        print("Request failed with status code: ${response.statusCode}");
        print("Response body: ${response.body}");
      }
    } catch (error) {
      print("Error during login: $error");
    }
    return null;
  }
}
