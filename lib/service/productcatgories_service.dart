import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:salesnrich_app_flutter/api/api.dart';
import 'package:salesnrich_app_flutter/model/productcategorymodel.dart';
import 'package:salesnrich_app_flutter/model/productgroupmodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductcategoriesService {
  final http.Client client = http.Client();

  Future<List<ProductcategoryModel?>> getAllProductcategory() async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    final token = pref.get('token');

    List<ProductcategoryModel> productcat = [];
    if (kDebugMode) {
      print(token);
    }

    try {
      final resposnse = await client
          .get(Uri.parse("${API().baseUrl}${API().productcategoryUrl}"), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      });

      if (resposnse.statusCode == 200) {
        final resposnseBody = jsonDecode(resposnse.body);
        for (var element in resposnseBody) {
          productcat.add(ProductcategoryModel.fromJson(element));
          if (kDebugMode) {
            print(ProductcategoryModel);
          }
        }
        return productcat;
      }
    } catch (e) {
      if (kDebugMode) {
        print("$e");
      }
    }
    return productcat;
  }
}
