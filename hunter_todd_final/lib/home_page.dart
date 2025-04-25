import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My CookBook')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome, Chef!',
                style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              icon: const Icon(Icons.menu_book),
              label: const Text('Open Cookbook'),
              onPressed: () => Navigator.pushNamed(context, '/recipes'),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              icon: const Icon(Icons.favorite),
              label: const Text('View Favorites'),
              onPressed: () => Navigator.pushNamed(context, '/favorites'),
            ),
          ],
        ),
      ),
    );
  }
}
