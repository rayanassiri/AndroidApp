import 'dart:convert';

import 'package:myapp/HomeWork2/data/routesApi.dart';

class UserService {
  get http => null;



  Future<Map<String, dynamic>?> login(String username, String password) async {

    final response = await http.post(
      Uri.parse(ConnString.login),

      headers: {
        'Content-Type': 'application/json',
      },

      body: json.encode({
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 401) {
      return null;
    } else {
      throw Exception('Failed to login');
    }
  }



  Future<bool> register(
      String name,
      String email,
      String username,
      String password
      ) async {

    final response = await http.post(
      Uri.parse(ConnString.register),

      headers: {
        'Content-Type': 'application/json',
      },

      body: json.encode({
        'name': name,
        'email': email,
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return true;
    } else if (response.statusCode == 409) {
      return false;
    } else {
      throw Exception('Registration failed: ${response.body}');
    }
  }




}