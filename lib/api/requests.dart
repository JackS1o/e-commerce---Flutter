import 'dart:convert';

import 'package:http/http.dart' as http;

class DataProvider {
  static var newData = [];
  static var index = 0;

  static Future fetchData() async {
    final response = await http.get(Uri.parse(
        'http://616d6bdb6dacbb001794ca17.mockapi.io/devnology/brazilian_provider'));
    if (response.statusCode == 200) {
      final responseJson = jsonDecode(utf8.decode(response.bodyBytes));
      newData = responseJson
          .map(
            (data) => {
              'id': data['id'],
              'nome': data['nome'],
              'preco': data['preco'],
              'imagem': data['imagem'],
              'descricao': data['descricao'],
              'hasDiscount': '',
              'desconto': '',
              'index': index += 1,
            },
          )
          .toList();
      return newData;
    } else {
      throw Exception('Failed to load data');
    }
  }

  static fetchAllData() {}
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

class DataEuropeanProvider {
  static var newData = [];
  static var index = 80;

  static Future fetchData() async {
    final response = await http.get(Uri.parse(
        'http://616d6bdb6dacbb001794ca17.mockapi.io/devnology/european_provider'));
    if (response.statusCode == 200) {
      final responseJson = jsonDecode(utf8.decode(response.bodyBytes));
      newData = responseJson
          .map(
            (data) => {
              'id': data['id'],
              'nome': data['name'],
              'preco': data['price'],
              'imagem': data['gallery'][0],
              'hasDiscount': data['hasDiscount'],
              'descricao': data['description'],
              'desconto': data['discountValue'],
              'index': index += 1,
            },
          )
          .toList();
      return newData;
    } else {
      throw Exception('Failed to load data');
    }
  }
}

class ProductDetailByIdEuropeanProvider {
  static Future fetch(productId) async {
    final response = await http.get(Uri.parse(
        'http://616d6bdb6dacbb001794ca17.mockapi.io/devnology/european_provider/$productId'));
    if (response.statusCode == 200) {
      final responseJson = jsonDecode(utf8.decode(response.bodyBytes));
      return responseJson;
    } else {
      throw Exception('Failed to load data');
    }
  }
}

class DataConcact {
  static Future fetchAllData() async {
    final response1 = DataProvider.fetchData();
    final response2 = DataEuropeanProvider.fetchData();
    final response3 = await Future.wait([response1, response2]);
    return response3[0];
  }
}
