import 'dart:convert';


import 'package:app_listado/models/users_model.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class ApiService {

 final String baseUrl = 'https://nk0blh78-8000.use2.devtunnels.ms/';
final Logger logger = Logger();


Future<List<dynamic>> getTareas() async {
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

  Future<Tarea> getTareaById(int id) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/tareas/$id'));
      if (response.statusCode == 200) {
        logger.i('Response data: ${response.body}');
        return Tarea.fromJson(json.decode(response.body));
      } else {
        logger.e('Error: ${response.statusCode}');
        throw Exception('Failed to load user: ${response.statusCode}');
      }
    } catch (e) {
      logger.e('Exception: $e');
      throw Exception('Failed to load user: $e');
    }
  }



  Future<bool> createTarea(Tarea tarea) async {
    try {
      final response = await http.post(Uri.parse('$baseUrl/tareas/'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(tarea.toJson())
      );

      if (response.statusCode == 201) {
        logger.i('Response data: ${response.body}');
        return true;
      } else {
        logger.e('Error: ${response.statusCode}');
        return false;
      }
      
    } catch (e) {
      logger.e('Exception: $e');
      throw Exception('Failed to create user: $e');
    }
  }




  Future<bool> updateTarea(Tarea tarea) async {
    try {
      final response = await http.put(Uri.parse('$baseUrl/tareas/${tarea.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(tarea.toJson())
      );

      if (response.statusCode == 200) {
        logger.i('Response data: ${response.body}');
        return true;
      } else {
        logger.e('Error: ${response.statusCode}');
        return false;
      }
      
    } catch (e) {
      logger.e('Exception: $e');
      throw Exception('Failed to update user: $e');
    }
  } 

  Future<bool> deleteTarea(int id) async {
    try {
      final response = await http.delete(Uri.parse('$baseUrl/tareas/$id'));
      if (response.statusCode == 204) {
        logger.i('Response data: ${response.body}');
        return true;
      } else {
        logger.e('Error: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      logger.e('Exception: $e');
      throw Exception('Failed to delete user: $e');
    }
  }


}