import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:salesnrich_app_flutter/api/api.dart';
import 'package:salesnrich_app_flutter/model/documentsmodel.dart';

import 'package:shared_preferences/shared_preferences.dart';

class DocumentsService {
  final Client = http.Client();
  Future<List<DocumentsModel>?> getalldocumets() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
   List <DocumentsModel> documentList = [];
    final token = pref.get('token');
    if (kDebugMode) {
      print(token);
    }
    try {
      final response = await Client.get(
          Uri.parse("${API().baseUrl}${API().documentsUrl}"),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token',
          });
      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        for (var element in responseBody) {
          var documentsModel = DocumentsModel.fromJson(element);
          documentList.add( documentsModel);
          if (kDebugMode) {
            print(documentsModel);
          }
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("$e");
      }
    }
    return documentList;
  }

  getAllDocuments() {}
}
