import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  final String idMeal;
  final String strMeal;
  final String strCategory;
  final String strArea;
  final String strInstructions;
  final String strMealThumb;
  final String strTags;
  final String strYoutube;
  final Map<String, String> ingredientsMap;
  const CustomCard(this.idMeal, this.strMeal, this.strArea, this.strCategory, this.strInstructions, this.strMealThumb, this.strTags, this.strYoutube, this.ingredientsMap, {super.key});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}