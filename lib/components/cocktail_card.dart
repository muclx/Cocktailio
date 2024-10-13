// cocktail_card.dart
import 'package:flutter/material.dart';
import 'cocktail.dart';

class CocktailCard extends StatelessWidget {
  final Cocktail cocktail;

  CocktailCard({required this.cocktail});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
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
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 1),
                    Text(
                      cocktail.name,
                      style: TextStyle(
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
                color: cocktail.isFavorite ? Colors.red : Colors.black,
              ),
              iconSize: 30,
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
