import 'dart:convert';

import 'package:http/http.dart' as http;

class DataProvider {
  static Future fetchData() async {
    final response = await http.get(Uri.parse(
        'http://616d6bdb6dacbb001794ca17.mockapi.io/devnology/brazilian_provider'));
    if (response.statusCode == 200) {
      final responseJson = jsonDecode(utf8.decode(response.bodyBytes));
      return responseJson;
    } else {
      throw Exception('Failed to load data');
    }
  }
}

class ProductDetailById {
  static Future fetch(productId) async {
    final response = await http.get(Uri.parse(
        'http://616d6bdb6dacbb001794ca17.mockapi.io/devnology/brazilian_provider/$productId'));
    if (response.statusCode == 200) {
      final responseJson = jsonDecode(utf8.decode(response.bodyBytes));
      return responseJson;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
