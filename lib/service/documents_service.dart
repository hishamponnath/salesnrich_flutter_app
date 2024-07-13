import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:salesnrich_app_flutter/api/api.dart';
import 'package:salesnrich_app_flutter/model/documentsmodel.dart';

import 'package:shared_preferences/shared_preferences.dart';

class DocumentsService {
  final Client = http.Client();
  Future<DocumentsModel?> getalldocumets() async { 
    SharedPreferences _pref = await SharedPreferences.getInstance();

    final token = _pref.get('token');
    print(token);
    try {
      final response = await Client.get(
          Uri.parse("${API().baseUrl}${API().documentsUrl}"),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          });
      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        final DocumentsModel document = DocumentsModel.fromJson(responseBody);
        print(document);
        return document;
      }
    } catch (e) {
      print("$e");
    }
  }
}
