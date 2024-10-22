import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_svg/flutter_svg.dart';
import 'cocktail.dart';
import 'cocktail_card.dart';
import 'cocktail_detail.dart';

class CocktailHomePage extends StatefulWidget {
  @override
  _CocktailHomePageState createState() => _CocktailHomePageState();
}

class _CocktailHomePageState extends State<CocktailHomePage> {
  final String apiUrl = 'https://cocktails.solvro.pl/api/v1/cocktails';
  late Future<List<Cocktail>> futureCocktails;

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
        Cocktail cocktail = Cocktail(
          id: cocktailJson['id'],
          name: cocktailJson['name'],
          instructions: cocktailJson['instructions'],
          alcoholic: cocktailJson['alcoholic'],
          category: cocktailJson['category'],
          glass: cocktailJson['glass'],
          imageUrl: cocktailJson['imageUrl'],
          createdAt: cocktailJson['createdAt'],
          updatedAt: cocktailJson['updatedAt'],
        );
        cocktails.add(cocktail);
      });

      return cocktails;
    } else {
      throw Exception('Failed to load cocktails');
    }
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
            icon: const Icon(Icons.favorite_border),
            iconSize: 26,
            onPressed: () {},
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
              padding: EdgeInsets.zero, // No padding around the grid
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                crossAxisSpacing: 0, // No spacing between columns
                mainAxisSpacing: 0, // No spacing between rows
                childAspectRatio: 0.75, // Adjust this value to fit your design
              ),
              itemCount: cocktails.length,
              itemBuilder: (context, index) {
                return CocktailCard(
                    cocktail: cocktails[
                        index]); 
              },
            );
          }
        },
      ),
    );
  }
}
