class Organization {
  final String englishName;
  final String tamilName;
  final String type;
  final String englishDescription;
  final String tamilDescription;
  final bool isImagePresent;
  final String category;
  final int createdAt;
  final int updatedAt;
  final int id;
  final String imageUrl;

  Organization({
    required this.englishName,
    required this.tamilName,
    required this.type,
    required this.englishDescription,
    required this.tamilDescription,
    required this.isImagePresent,
    required this.category,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
    required this.imageUrl,
  });

  factory Organization.fromJson(Map<String, dynamic> json) {
    return Organization(
      englishName: json['name']['en'],
      tamilName: json['name']['ta'],
      type: json['type'],
      englishDescription: json['description']['en'],
      tamilDescription: json['description']['ta'],
      isImagePresent: json['isImagePresent'],
      category: json['category'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      id: json['id'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': {'en': englishName, 'ta': tamilName},
      'type': type,
      'description': {'en': englishDescription, 'ta': tamilDescription},
      'isImagePresent': isImagePresent,
      'category': category,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'id': id,
      'imageUrl': imageUrl,
    };
  }
}
