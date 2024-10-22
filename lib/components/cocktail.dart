class Cocktail {
  final int id;
  final String name;
  final String instructions;
  final bool alcoholic;
  final String category;
  final String glass;
  final String imageUrl;
  final String createdAt;
  final String updatedAt;
  bool isFavorite; 

  Cocktail({
    required this.id,
    required this.name,
    required this.instructions,
    required this.alcoholic,
    required this.category,
    required this.glass,
    required this.imageUrl,
    required this.createdAt,
    required this.updatedAt,
    this.isFavorite = false, 
  });

  factory Cocktail.fromJson(Map<String, dynamic> json) {
    return Cocktail(
      id: json['id'],
      name: json['name'],
      instructions: json['instructions'] ?? '',
      alcoholic: json['alcoholic'] ?? false,
      category: json['category'] ?? '',
      glass: json['glass'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      createdAt: json['createdAt'] ?? '',
      updatedAt: json['updatedAt'] ?? '',
      isFavorite: json['isFavorite'] ?? false, 
    );
  }
}
