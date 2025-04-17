import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> fetchRecipe() async {
  final url =
      Uri.parse('https://www.themealdb.com/api/json/v1/1/search.php?s=Arrabiata');
  final response = await http.get(url);
  
  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Failed to load recipe');
  }
}

class RecipeList extends StatelessWidget {
  const RecipeList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipes'),
      ),
      body: const Center(
        child: Text('List of Recipes will appear here'),
      ),
    );
  }
}
