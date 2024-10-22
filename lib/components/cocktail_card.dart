import 'package:flutter/material.dart';
import 'cocktail.dart';
import 'cocktail_detail.dart';

class CocktailCard extends StatefulWidget {
  final Cocktail cocktail;

  const CocktailCard({Key? key, required this.cocktail}) : super(key: key);

  @override
  _CocktailCardState createState() => _CocktailCardState();
}

class _CocktailCardState extends State<CocktailCard> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = false; 
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CocktailDetailPage(cocktail: widget.cocktail),
          ),
        );
      },
      child: Card(
        elevation: 0, 
        margin: EdgeInsets.zero, 
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero,
          side: BorderSide(
            color: Colors.black,
            width: 0.4,
          ),
        ),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                
                ClipRRect(
                  borderRadius: BorderRadius.zero,
                  child: Image.network(
                    widget.cocktail.imageUrl,
                    height: 220, 
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.cocktail.category,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 1),
                      Text(
                        widget.cocktail.name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
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
                  isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite ? Colors.red : Colors.white,
                ),
                iconSize: 30,
                onPressed: () {
                  setState(() {
                    isFavorite = !isFavorite; 
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
