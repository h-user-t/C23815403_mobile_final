import 'package:flutter/material.dart';
import '/meal.dart';

class CustomCard extends StatelessWidget {
  final Meal meal;
  const CustomCard(this.meal, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(meal.name,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                meal.thumbnail,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Text('Category: ${meal.category}   •   Area: ${meal.area}',
                style: Theme.of(context).textTheme.labelMedium),
            const Divider(height: 24),
            const Text('Ingredients',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ...meal.ingredients.entries
                .map((e) => Text('• ${e.key}: ${e.value}')),
            const Divider(height: 24),
            const Text('Instructions',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(meal.instructions),
          ],
        ),
      ),
    );
  }
}
