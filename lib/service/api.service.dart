import 'dart:convert';

import 'package:app_listado/models/users_model.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class ApiService {

 final String baseUrl = 'https://nk0blh78-8000.use2.devtunnels.ms/';
final Logger logger = Logger();


Future<List<dynamic>> getUsers() async {
  try {
    final response = await http.get(Uri.parse('$baseUrl/tareas/'));
    if (response.statusCode == 200) {
      logger.i('Response data: ${response.body}');
      return json.decode(response.body);
    } else {
      logger.e('Error: ${response.statusCode}');
      throw Exception('Failed to load users: ${response.statusCode}');
    }
  } catch (e) {
    logger.e('Exception: $e');
    throw Exception('Failed to load users: $e');
  }

  }

  Future<UsersModel> getUserById(int id) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/tareas/$id'));
      if (response.statusCode == 200) {
        logger.i('Response data: ${response.body}');
        return UsersModel.fromJson(json.decode(response.body));
      } else {
        logger.e('Error: ${response.statusCode}');
        throw Exception('Failed to load user: ${response.statusCode}');
      }
    } catch (e) {
      logger.e('Exception: $e');
      throw Exception('Failed to load user: $e');
    }
  }

}