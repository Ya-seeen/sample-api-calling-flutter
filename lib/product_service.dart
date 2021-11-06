import 'dart:convert';

import 'package:sabuj_demo/models/product.dart';
import 'package:http/http.dart' as http;

class ProductService {

  Future<List<Product>>? getProductList() async {
    try {
      var url = Uri.parse('http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline');
      var response = await http.get(url);
      print("FULL RESPONSE");
      print(response);
      print("STATUS CODE");
      print(response.statusCode);
      print("BODY");
      print(response.body);
      List<Product> products = [];
      for (var element in json.decode(response.body)) {
        products.add(Product.fromJson(element));
      }
      return products;
    } catch(ex) {
      rethrow;
    }
  }
}