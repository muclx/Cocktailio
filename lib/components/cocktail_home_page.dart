import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_svg/flutter_svg.dart';
import 'cocktail.dart';
import 'cocktail_card.dart';

class CocktailHomePage extends StatefulWidget {
  @override
  _CocktailHomePageState createState() => _CocktailHomePageState();
}

class _CocktailHomePageState extends State<CocktailHomePage> {
  final String apiUrl = 'https://cocktails.solvro.pl/api/v1/cocktails';
  late Future<List<Cocktail>> futureCocktails;
  List<Cocktail> favoriteCocktails = [];

  @override
  void initState() {
    super.initState();
    futureCocktails = fetchCocktails();
  }

  Future<List<Cocktail>> fetchCocktails() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List<Cocktail> cocktails = [];
      List<dynamic> data = jsonDecode(response.body)['data'];

      data.forEach((cocktailJson) {
        Cocktail cocktail = Cocktail.fromJson(cocktailJson);
        cocktails.add(cocktail);
      });

      return cocktails;
    } else {
      throw Exception('Failed to load cocktails');
    }
  }

  void _toggleFavorite(Cocktail cocktail) {
    setState(() {
      cocktail.isFavorite = !cocktail.isFavorite;

      if (cocktail.isFavorite) {
        favoriteCocktails.add(cocktail);
      } else {
        favoriteCocktails.remove(cocktail);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SvgPicture.asset(
              'assets/Logo/LOGO.svg',
              height: 24.0,
              width: 24.0,
            ),
            const SizedBox(width: 8),
            const Text(
              'Cocktail.io',
              style: TextStyle(
                fontFamily: 'Aboreto',
                fontSize: 20,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            iconSize: 26,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoriteCocktailsPage(
                    favoriteCocktails: favoriteCocktails,
                    onFavoriteToggle: _toggleFavorite, 
                  ),
                ),
              );
            },
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'EN',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
      body: FutureBuilder<List<Cocktail>>(
        future: futureCocktails,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data available'));
          } else {
            List<Cocktail> cocktails = snapshot.data!;
            return GridView.builder(
              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                childAspectRatio: 0.75,
              ),
              itemCount: cocktails.length,
              itemBuilder: (context, index) {
                return CocktailCard(
                  cocktail: cocktails[index],
                  onFavoriteToggle: () => _toggleFavorite(cocktails[index]),
                );
              },
            );
          }
        },
      ),
    );
  }
}

class FavoriteCocktailsPage extends StatelessWidget {
  final List<Cocktail> favoriteCocktails;
  final Function(Cocktail) onFavoriteToggle;

  FavoriteCocktailsPage({required this.favoriteCocktails, required this.onFavoriteToggle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ulubione Drinki'),
      ),
      body: favoriteCocktails.isEmpty
          ? Center(child: Text('Brak ulubionych drinków'))
          : GridView.builder(
              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                childAspectRatio: 0.75,
              ),
              itemCount: favoriteCocktails.length,
              itemBuilder: (context, index) {
                return CocktailCard(
                  cocktail: favoriteCocktails[index],
                  onFavoriteToggle: () => onFavoriteToggle(favoriteCocktails[index]), 
                );
              },
            ),
    );
  }
}
