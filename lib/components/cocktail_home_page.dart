// cocktail_home_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'cocktail.dart';
import 'cocktail_card.dart';

class CocktailHomePage extends StatelessWidget {
  final List<Cocktail> cocktails = [
    Cocktail(
      name: '"SEX ON THE BEACH"',
      image: 'assets/sex_on_the_beach.jpg',
      isFavorite: true,
      description: 'Napój alkoholowy',
    ),
    Cocktail(
      name: '"MOJITO"',
      image: 'assets/mojito.jpg',
      isFavorite: true,
      description: 'Napój alkoholowy',
    ),
    Cocktail(
      name: '"PINA COLADA"',
      image: 'assets/pina_colada.jpg',
      isFavorite: false,
      description: 'Napój alkoholowy',
    ),
    Cocktail(
      name: '"MARTINI"',
      image: 'assets/martini.jpg',
      isFavorite: false,
      description: 'Napój alkoholowy',
    ),
    Cocktail(
      name: '"COSMOPOLITAN"',
      image: 'assets/cosmopolitan.jpg',
      isFavorite: false,
      description: 'Napój alkoholowy',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            SvgPicture.asset(
              'assets/Logo/LOGO.svg', // Ścieżka do pliku SVG
              height: 24.0, // Wysokość ikony
              width: 24.0, // Szerokość ikony
            ), // Ikona z drinkiem
            const SizedBox(width: 8), // Odstęp między ikoną a tytułem
            const Text(
              'Cocktail.io',
              style: TextStyle(
                fontFamily: 'Aboreto', // Zmiana czcionki tylko dla tytułu
                fontSize: 20, // Ustal rozmiar czcionki// Ustal styl czcionki
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            iconSize: 26,
            onPressed: () {
              // Obsługa akcji dla ulubionych
            },
          ),
          TextButton(
            onPressed: () {
              // Obsługa akcji dla przycisku "EN"
            },
            child: const Text(
              'EN',
              style: TextStyle(
                color: Colors.black, // Kolor tekstu
                fontSize: 18, // Rozmiar czcionki
              ),
            ),
          ),
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.zero,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          childAspectRatio: 0.7,
        ),
        itemCount: cocktails.length,
        itemBuilder: (context, index) {
          return CocktailCard(cocktail: cocktails[index]);
        },
      ),
    );
  }
}
