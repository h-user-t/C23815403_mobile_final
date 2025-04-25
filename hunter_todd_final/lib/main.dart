import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '/home_page.dart';
import '/recipe_list_page.dart';
import '/search_page.dart';
import '/favorites_page.dart';

void main() => runApp(const MyCookBook());

class MyCookBook extends StatelessWidget {
  const MyCookBook({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My CookBook',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        textTheme: GoogleFonts.merriweatherTextTheme(),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/':          (_) => const HomePage(),
        '/recipes':   (_) => const RecipeListPage(),
        '/search':    (_) => const SearchPage(),
        '/favorites': (_) => const FavoritesPage(),
      },
    );
  }
}
