
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/food_model.dart';


class Webservice {
  Future<Foods> fetchJawads() async {
    String url = "http://demo5737957.mockable.io/12345";

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final jawad = Jawad.fromJson(json);
        return jawad.foods;
      } else {
        throw Exception('Failed to fetch data: ${response.statusCode}');
      }
    } catch (exception) {
      if (kDebugMode) {
        print(exception);
      }
      if (kDebugMode) {
        print('Problem parsing data from the server');
      }
      // Handle the error here, either throw the exception or return a default value
      throw Exception('Failed to fetch data: $exception');
    }

  }
}
