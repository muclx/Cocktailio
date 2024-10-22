import 'package:flutter/material.dart';
import 'dart:ui'; 
import 'cocktail.dart';

class CocktailDetailPage extends StatefulWidget {
  final Cocktail cocktail;

  CocktailDetailPage({required this.cocktail});

  @override
  _CocktailDetailPageState createState() => _CocktailDetailPageState();
}

class _CocktailDetailPageState extends State<CocktailDetailPage> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.cocktail.isFavorite; 
  }

  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.cocktail.name),
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 520, 
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.cocktail.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),

          Container(
            width: double.infinity,
            height: 520, 
            decoration: BoxDecoration(
              color:
                  Colors.black.withOpacity(0.3),
            ),
          ),
          Positioned(
            right: 20.0,
            top: 20.0,
            child: IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.white,
                size: 50.0, 
              ),
              onPressed: _toggleFavorite, 
            ),
          ),
          DraggableScrollableSheet(
            minChildSize: 0.4, 
            maxChildSize: 0.5, 
            builder: (BuildContext context, ScrollController scrollController) {
              return ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                      sigmaX: 60.0, sigmaY: 60.0), 
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white
                          .withOpacity(0.8),
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: Offset(0, -2),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        GestureDetector(
                          onVerticalDragUpdate: (details) {
                            scrollController.jumpTo(
                                scrollController.position.pixels -
                                    details.delta.dy);
                          },
                          child: Container(
                            height: 5,
                            width: 40,
                            margin: EdgeInsets.only(top: 10), 
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(22.0),
                            child: SingleChildScrollView(
                              controller: scrollController,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${widget.cocktail.category}', // Display cocktail category
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: const Color.fromARGB(
                                          255, 121, 121, 121),
                                    ),
                                  ),
                                  Text(
                                    '"${widget.cocktail.name}"', 
                                    style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  Text(
                                    'Instructions:', 
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    widget.cocktail
                                        .instructions,
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
