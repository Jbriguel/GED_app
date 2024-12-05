import 'package:flutter/material.dart';
import 'package:ged_app/core/modele/user_model.dart';
import '../repository/user_repository.dart';

class UserProvider with ChangeNotifier {
  UserRepository userRepository = UserRepository();
  String? _token;
  User? _userProfile;
  bool _isLoading = false;
  String? _error;

  // Getters
  String? get token => _token;
  User? get userProfile => _userProfile;
  bool get isLoading => _isLoading;
  String? get error => _error;

  // Méthode de connexion
  Future<void> login(String email, String password) async {
    _isLoading = true;
    _error = null;
    notifyListeners(); // Mise à jour des widgets dépendants

    try {
      _token = await userRepository.login(email, password);
      await fetchUserProfile(); // Récupérer le profil après connexion
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Méthode pour récupérer le profil utilisateur
  Future<void> fetchUserProfile() async {
    if (_token == null) return;

    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      Map<String, dynamic> _data = await userRepository.getUserProfile(_token!);
      _userProfile = User.fromJson(_data);
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Méthode de déconnexion
  void logout() {
    _token = null;
    _userProfile = null;
    notifyListeners();
  }

  // Méthode pour enregistrer un nouvel utilisateur
  Future<void> registerUser(Map<String, dynamic> userData) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      await userRepository.registerUser(userData);
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Méthode pour mettre à jour le profil utilisateur
  Future<void> updateUserProfile(Map<String, dynamic> userData) async {
    if (_token == null) return;

    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      await userRepository.updateUserProfile(_token!, userData);
      await fetchUserProfile(); // Rafraîchir les données du profil
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
