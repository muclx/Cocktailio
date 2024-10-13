// cocktail.dart
class Cocktail {
  final String name;
  final String image;
  final bool isFavorite;
  final String description; // Krótszy opis
  final String longDescription; // Dłuższy opis
  final List<String> ingredients;
  final List<String> preparation;

  Cocktail({
    required this.name,
    required this.image,
    required this.isFavorite,
    required this.description,
    required this.longDescription,
    required this.ingredients,
    required this.preparation,
  });
}
