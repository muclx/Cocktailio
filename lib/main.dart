// main.dart
import 'package:flutter/material.dart';
import './components/cocktail_home_page.dart';

void main() {
  runApp(CocktailApp());
}

class CocktailApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cocktail App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Montserrat',
      ),
      home: CocktailHomePage(),
    );
  }
}
