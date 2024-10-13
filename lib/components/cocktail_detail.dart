import 'package:flutter/material.dart';
import 'dart:ui'; // Import required for BackdropFilter
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
    isFavorite = widget.cocktail.isFavorite; // Initialize the favorite state
  }

  void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
      // Update the cocktail object if needed
      // widget.cocktail.isFavorite = isFavorite;
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
          // Image of the cocktail
          Container(
            width: double.infinity,
            height: 450,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.cocktail.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Favorite icon overlay on the image
          Positioned(
            right: 20.0,
            top: 20.0,
            child: GestureDetector(
              onTap: _toggleFavorite,
              child: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.white,
                size: 40.0, // Adjust size as needed
              ),
            ),
          ),
          // DraggableScrollableSheet for the details
          DraggableScrollableSheet(
            initialChildSize: 0.5, // Initial size of the container
            minChildSize: 460 /
                MediaQuery.of(context).size.height, // Minimum size in ratio
            maxChildSize: .7, // Allow it to be fully open (maximum)
            builder: (BuildContext context, ScrollController scrollController) {
              return ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                      sigmaX: 60.0, sigmaY: 60.0), // Wewnętrzny blur
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white
                          .withOpacity(0.8), // Semi-transparent background
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
                        // Draggable handle
                        GestureDetector(
                          onVerticalDragUpdate: (details) {
                            // Update the draggable sheet position
                            scrollController.jumpTo(
                                scrollController.position.pixels -
                                    details.delta.dy);
                          },
                          child: Container(
                            height: 5,
                            width: 40,
                            margin: EdgeInsets.only(
                                top: 10), // Tylko margines górny
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
                                  // Cocktail description
                                  Text(
                                    widget.cocktail.description,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: const Color.fromARGB(
                                            255, 121, 121, 121)),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    widget.cocktail
                                        .name, // Display the cocktail name
                                    style: TextStyle(
                                      fontSize: 24,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    widget.cocktail.longDescription,
                                    style: TextStyle(fontSize: 16),
                                    textAlign: TextAlign.justify,
                                  ),
                                  const SizedBox(height: 16),
                                  // Ingredients section as ExpansionTile (expanded by default)
                                  ExpansionTile(
                                    title: Text(
                                      'Składniki',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    initiallyExpanded:
                                        true, // Set to true for default expansion
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 16.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ...widget.cocktail.ingredients
                                                .asMap()
                                                .entries
                                                .map((entry) {
                                              int index = entry.key;
                                              String ingredient = entry.value;

                                              return Padding(
                                                padding: EdgeInsets.only(
                                                  bottom: index ==
                                                          widget
                                                                  .cocktail
                                                                  .ingredients
                                                                  .length -
                                                              1
                                                      ? 16.0
                                                      : 0.0,
                                                ),
                                                child: Row(
                                                  children: [
                                                    const Text("• ",
                                                        style: TextStyle(
                                                            fontSize: 16)),
                                                    Expanded(
                                                      child: Text(ingredient,
                                                          style: TextStyle(
                                                              fontSize: 16)),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }).toList(),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Preparation section as ExpansionTile
                                  ExpansionTile(
                                    title: Text(
                                      'Sposób przygotowania',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 16.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ...widget.cocktail.preparation
                                                .asMap()
                                                .entries
                                                .map((entry) {
                                              int index = entry.key;
                                              String step = entry.value;

                                              return Padding(
                                                padding: EdgeInsets.only(
                                                  bottom: index ==
                                                          widget
                                                                  .cocktail
                                                                  .preparation
                                                                  .length -
                                                              1
                                                      ? 16.0
                                                      : 0.0,
                                                ),
                                                child: Row(
                                                  children: [
                                                    const Text("• ",
                                                        style: TextStyle(
                                                            fontSize: 16)),
                                                    Expanded(
                                                      child: Text(step,
                                                          style: TextStyle(
                                                              fontSize: 16)),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }).toList(),
                                          ],
                                        ),
                                      ),
                                    ],
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
