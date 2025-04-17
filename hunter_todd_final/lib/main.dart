import 'package:flutter/material.dart';
import 'recipes.dart';

void main() {
  runApp(const MyCookBook());
}



class MyCookBook extends StatelessWidget {
  const MyCookBook({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My CookBook',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyCookBookApp(),
    );
  }
}

class MyCookBookApp extends StatefulWidget {
  const MyCookBookApp({super.key});

  @override
  State<MyCookBookApp> createState() => _MyCookBookAppState();
}

class _MyCookBookAppState extends State<MyCookBookApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My CookBook'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome to My CookBook!',
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => RecipeList()));
              },
              child: const Text('View Recipes'),
            ),
          ],
        ),
      ),
    );
  }
}

