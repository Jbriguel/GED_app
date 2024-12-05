import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class DocumentRepository {
  final String _baseUrl = 'http://localhost:8080/api/v1/ged';

  // Fetch all documents
  Future<List<dynamic>> fetchDocuments() async {
    final response = await http.get(Uri.parse('$_baseUrl/documents'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to fetch documents');
    }
  }

  // Search documents by query
  Future<List<dynamic>> searchDocuments(String query) async {
    final response = await http.get(Uri.parse('$_baseUrl/search?query=$query'));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to search documents');
    }
  }

  // Upload a document
  Future<void> uploadDocument(File file) async {
    var uri = Uri.parse('$_baseUrl/upload');
    var request = http.MultipartRequest('POST', uri);
    request.files.add(await http.MultipartFile.fromPath('file', file.path));

    final response = await request.send();
    if (response.statusCode != 200) {
      throw Exception('Failed to upload document');
    }
  }

  // Validate a document
  Future<void> validateDocument(String documentId) async {
    final response =
        await http.post(Uri.parse('$_baseUrl/validate/$documentId'));
    if (response.statusCode != 200) {
      throw Exception('Failed to validate document');
    }
  }

  // Open a document (returns file data as bytes)
  Future<List<int>> getDocumentContent(String documentId) async {
    final response = await http.get(Uri.parse('$_baseUrl/content/$documentId'));
    if (response.statusCode == 200) {
      return response.bodyBytes; // Return the binary data of the file
    } else {
      throw Exception('Failed to fetch document content');
    }
  }
}
