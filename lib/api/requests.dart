import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

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
              'hasDiscount': null,
              'desconto': null,
              'index': index += 1,
            },
          )
          .toList();
      return newData;
    } else {
      throw Exception('Failed to load data');
    }
  }

  static void fetchProduct(Object productId) {}
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
  static var index = 158;

  static Future fetchEuropeanData() async {
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
      var obj = {
        'id': responseJson['id'],
        'nome': responseJson['name'],
        'preco': responseJson['price'],
        'imagem': responseJson['gallery'][0],
        'hasDiscount': responseJson['hasDiscount'],
        'descricao': responseJson['description'],
        'desconto': responseJson['discountValue'],
        'categoria': '',
      };
      return obj;
    } else {
      throw Exception('Failed to load data');
    }
  }
}

class DataConcact {
  static Future fetchAllData() async {
    final response1 = DataProvider.fetchData();
    final response2 = DataEuropeanProvider.fetchEuropeanData();
    final response3 = await Future.wait([response1, response2]);
    final response4 = [...response3[0], ...response3[1]];
    return response4;
  }
}

class UserLogin {
  static Future fetchUserLogin(userData) async {
    final response = await http.post(
      Uri.parse(
        'http://localhost:3000/user',
      ),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        'email': userData['email'],
        'password': userData['password'],
      }),
    );
    if (response.statusCode == 200) {
      final responseJson = jsonDecode(utf8.decode(response.bodyBytes));
      final prefs = await SharedPreferences.getInstance();
      prefs.setInt('userId', responseJson);
      return responseJson;
    } else {
      throw Exception('Failed to load data');
    }
  }
}

class UserProducts {
  static var products;

  static Future fetchUserProducts(uniqueItems, itemCount) async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt('userId');
    products = uniqueItems
        .map((item) => {
              'userId': userId,
              'name': item['nome'],
              'price': item['preco'],
              'image': item['imagem'],
              'quantity': itemCount[item['id']],
            })
        .toList();

    final response = await http.post(
      Uri.parse(
        'http://localhost:3000/product',
      ),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(products),
    );
    if (response.statusCode == 200) {
      final responseJson = jsonDecode(utf8.decode(response.bodyBytes));
      return responseJson;
    } else {
      throw Exception('Failed to load data');
    }
  }
}

class GetUserProducts {
  static Future getUserProducts() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getInt('userId');
    final response = await http.get(
      Uri.parse(
        'http://localhost:3000/product/$userId',
      ),
    );
    if (response.statusCode == 200) {
      final responseJson = jsonDecode(utf8.decode(response.bodyBytes));
      return responseJson;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
