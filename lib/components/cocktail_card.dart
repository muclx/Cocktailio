// cocktail_card.dart
import 'package:flutter/material.dart';
import 'cocktail.dart';
import 'cocktail_detail.dart'; // Importujemy nową stronę

class CocktailCard extends StatelessWidget {
  final Cocktail cocktail;

  CocktailCard({required this.cocktail});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Przejdź do szczegółów koktajlu
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CocktailDetailPage(cocktail: cocktail),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.zero,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
          side: BorderSide(
            color: Colors.black,
            width: 0.8,
          ),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.zero,
                    child: Image.asset(
                      cocktail.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cocktail.description,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 1),
                      Text(
                        cocktail.name,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 10,
              right: 10,
              child: IconButton(
                icon: Icon(
                  cocktail.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: cocktail.isFavorite ? Colors.red : Colors.white,
                ),
                iconSize: 30,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
