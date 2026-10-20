import 'dart:convert';

import 'routesApi.dart';

class ProductService {

  Future<List<dynamic>> getProducts(dynamic http) async {

    final response = await http.get(
      Uri.parse(ConnString.products),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load products');
    }
  }
}