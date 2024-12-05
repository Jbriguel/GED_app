import 'dart:convert';
import 'package:http/http.dart' as http;

class UserRepository {
  final String baseUrl = 'http://localhost:8080/api/v1/ged';
  UserRepository();

  // Méthode de connexion
  Future<String> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/signin'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['token']; // Retourne le token JWT
    } else {
      throw Exception('Failed to login');
    }
  }

  // Méthode pour obtenir les détails de l'utilisateur
  Future<Map<String, dynamic>> getUserProfile(String token) async {
    final response = await http.get(
      Uri.parse('$baseUrl/user/profile'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body); // Retourne les données de l'utilisateur
    } else {
      throw Exception('Failed to fetch user profile');
    }
  }

  // Méthode pour mettre à jour les informations de l'utilisateur
  Future<void> updateUserProfile(
      String token, Map<String, dynamic> userData) async {
    final response = await http.put(
      Uri.parse('$baseUrl/user/profile'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode(userData),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update user profile');
    }
  }

  // Méthode pour enregistrer un nouvel utilisateur
  Future<void> registerUser(Map<String, dynamic> userData) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/signup'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(userData),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to register user');
    }
  }
}
