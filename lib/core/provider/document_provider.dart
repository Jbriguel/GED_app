import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ged_app/core/modele/document_model.dart';
import 'package:ged_app/core/modele/user_model.dart';
import 'package:ged_app/core/repository/document_repository.dart';

class DocumentProvider with ChangeNotifier {
  final DocumentRepository _repository = DocumentRepository();

  User? user;
  List<Document> _documents = [
    Document(
      id: 1,
      name: 'Rapport_financier_2024',
      path: '/documents/reports/rapport_financier_2024.pdf',
      type: 'PDF',
      updatedAt: DateTime.now().subtract(Duration(days: 5)),
      createdAt: DateTime.now().subtract(Duration(days: 30)),
      validated: true,
      serviceName: 'Finance',
      archivedBy: 'Alice Dupont',
    ),
    Document(
      id: 2,
      name: 'Guide_utilisateur_erudite',
      path: '/documents/guides/guide_utilisateur_erudite.pdf',
      type: 'PDF',
      updatedAt: DateTime.now().subtract(Duration(days: 2)),
      createdAt: DateTime.now().subtract(Duration(days: 25)),
      validated: true,
      serviceName: 'Support',
      archivedBy: 'Bob Martin',
    ),
    Document(
      id: 3,
      name: 'Synthese_projet_apprentissage',
      path: '/documents/projects/synthese_projet_apprentissage.pdf',
      type: 'PDF',
      updatedAt: DateTime.now().subtract(Duration(days: 1)),
      createdAt: DateTime.now().subtract(Duration(days: 40)),
      validated: false,
      serviceName: 'Éducation',
      archivedBy: 'Charles Leroy',
    ),
    Document(
      id: 4,
      name: 'logo_erudite',
      path: '/images/logo_erudite.png',
      type: 'Image',
      updatedAt: DateTime.now().subtract(Duration(days: 3)),
      createdAt: DateTime.now().subtract(Duration(days: 60)),
      validated: true,
      serviceName: 'Design',
    ),
    Document(
      id: 5,
      name: 'diagramme_flux_travail',
      path: '/images/diagramme_flux_travail.jpg',
      type: 'Image',
      updatedAt: DateTime.now().subtract(Duration(days: 7)),
      createdAt: DateTime.now().subtract(Duration(days: 90)),
      validated: true,
      serviceName: 'Gestion',
    ),
    Document(
      id: 6,
      name: 'photo_profil_utilisateur',
      path: '/images/profils/photo_profil_utilisateur.png',
      type: 'Image',
      updatedAt: DateTime.now().subtract(Duration(days: 4)),
      createdAt: DateTime.now().subtract(Duration(days: 50)),
      validated: false,
    ),
    Document(
      id: 7,
      name: 'Plan_cours_sciences',
      path: '/documents/cours/plan_cours_sciences.docx',
      type: 'DOCX',
      updatedAt: DateTime.now().subtract(Duration(days: 6)),
      createdAt: DateTime.now().subtract(Duration(days: 35)),
      validated: true,
      serviceName: 'Éducation',
      archivedBy: 'David Michel',
    ),
    Document(
      id: 8,
      name: 'Contrat_partenariat',
      path: '/documents/contrats/contrat_partenariat.docx',
      type: 'DOCX',
      updatedAt: DateTime.now().subtract(Duration(days: 8)),
      createdAt: DateTime.now().subtract(Duration(days: 80)),
      validated: true,
      serviceName: 'Juridique',
    ),
    Document(
      id: 9,
      name: 'Memo_interne_formation',
      path: '/documents/memos/memo_interne_formation.docx',
      type: 'DOCX',
      updatedAt: DateTime.now().subtract(Duration(days: 10)),
      createdAt: DateTime.now().subtract(Duration(days: 100)),
      validated: false,
      archivedBy: 'Emma Laurent',
    ),
    Document(
      id: 10,
      name: 'Tableau_statistiques_utilisateurs',
      path: '/documents/excel/tableau_statistiques_utilisateurs.xlsx',
      type: 'XLSX',
      updatedAt: DateTime.now().subtract(Duration(days: 2)),
      createdAt: DateTime.now().subtract(Duration(days: 70)),
      validated: true,
      serviceName: 'Analytique',
    ),
  ];
  bool _isLoading = false;
  String? _errorMessage;

  List<Document> get documents => _documents;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  void updateUser(User? _user) {
    user = _user;
    notifyListeners();
  }

  // Fetch all documents
  Future<void> fetchDocuments() async {
    _setLoadingState(true);
    try {
      //_documents = await _repository.fetchDocuments();
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    }
    _setLoadingState(false);
  }

  // Search documents
  Future<void> searchDocuments(String query) async {
    _setLoadingState(true);
    try {
      //_documents = await _repository.searchDocuments(query);
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    }
    _setLoadingState(false);
  }

  // Upload document
  Future<void> uploadDocument(File file) async {
    _setLoadingState(true);
    try {
      await _repository.uploadDocument(file);
      await fetchDocuments(); // Refresh the document list
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    }
    _setLoadingState(false);
  }

  // Validate document
  Future<void> validateDocument(String documentId) async {
    _setLoadingState(true);
    try {
      await _repository.validateDocument(documentId);
      await fetchDocuments(); // Refresh the document list
      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    }
    _setLoadingState(false);
  }

  // Private method to set the loading state and notify listeners
  void _setLoadingState(bool value) {
    _isLoading = value;
    notifyListeners(); // Update UI when the state changes
  }
}
