import 'dart:convert';
import 'connection.dart';


class ProductService {


  Future<List<dynamic>> getProducts(dynamic http) async {
    final response = await http.get(
      Uri.parse(ConnectionString.products),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to load products");
    }
  }
}