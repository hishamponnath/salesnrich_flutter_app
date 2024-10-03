import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:salesnrich_app_flutter/api/api.dart';
import 'package:salesnrich_app_flutter/model/productgroupmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductgroupService {
  final http.Client client = http.Client();

  Future<List<ProductgroupModel?>> getAllProductgroup() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    final token = pref.get('token');

    List<ProductgroupModel> product = [];
    if (kDebugMode) {
      print(token);
    }

    try {
      final resposnse = await client
          .get(Uri.parse("${API().baseUrl}${API().productgroupUrl}"), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      });

      if (resposnse.statusCode == 200) {
        final resposnseBody = jsonDecode(resposnse.body);
        for (var element in resposnseBody) {
          product.add(ProductgroupModel.fromJson(element));
          if (kDebugMode) {
            print(ProductgroupModel);
          }
        }
        return product;
      }
    } catch (e) {
      if (kDebugMode) {
        print("$e");
      }
    }
    return product;
  }
}
