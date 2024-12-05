class Document {
  final int id;
  final String name;
  final String path;
  final String type;
  final DateTime updatedAt;
  final DateTime createdAt;
  final DateTime? archivedAt;
  final bool validated;
  final String? serviceName;
  final String? archivedBy;

  Document({
    required this.id,
    required this.name,
    required this.path,
    required this.type,
    required this.updatedAt,
    required this.createdAt,
    this.archivedAt,
    required this.validated,
    this.serviceName,
    this.archivedBy,
  });

  // Convertit un JSON en instance de Document
  factory Document.fromJson(Map<String, dynamic> json) {
    return Document(
      id: json['id'],
      name: json['name'],
      path: json['path'],
      type: json['type'],
      updatedAt: DateTime.parse(json['updatedAt']),
      createdAt: DateTime.parse(json['createdAt']),
      archivedAt: json['archivedAt'] != null ? DateTime.parse(json['archivedAt']) : null,
      validated: json['validated'],
      serviceName: json['service']?['name'],  // Récupère le nom du service s'il existe
      archivedBy: json['archivedBy']?['firstName'], // Récupère l'utilisateur archiviste s'il existe
    );
  }

  // Convertit une instance de Document en JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'path': path,
      'type': type,
      'updatedAt': updatedAt.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'archivedAt': archivedAt?.toIso8601String(),
      'validated': validated,
      'service': serviceName != null ? {'name': serviceName} : null,
      'archivedBy': archivedBy != null ? {'firstName': archivedBy} : null,
    };
  }
}
