import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/menus.dart';

class ApiService{
  static const String Baseurl= "http://localhost:3000/";
  static var client = http.Client();

   Future<List<Menus>?> getProducts() async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };

    var url = Uri.http(Baseurl);

    var response = await client.get(
      url,
      headers: requestHeaders,
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data.map((item) =>Menus.fromJson(item)).toList();

      //return true;
    } else {
      return null;
    }
  }

  Future<void> addData(Menus menus) async {
    final response = await http.post(Uri.parse(Baseurl),

        body: jsonEncode(menus.toJson())
    );
    if (response.statusCode == 201) {
      if (kDebugMode) {
        print("successfully added");
      }
      else {
        throw Exception('Failed to post data');
      }
    }
  }
}