import 'package:flutter/material.dart';
import '/favorites_store.dart';
import '/meal.dart';
import 'recipe_detail_page.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final favStore = FavoritesStore.instance;

  Future<void> _openDetail(Meal m) async {
    final changed = await Navigator.push<bool>(
          context,
          MaterialPageRoute(builder: (_) => RecipeDetailPage(meal: m)),
        ) ??
        false;
    if (changed) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final favs = favStore.favorites;

    return Scaffold(
      appBar: AppBar(title: const Text('My Favorites')),
      body: favs.isEmpty
          ? const Center(child: Text('No favorites yet.'))
          : ListView.separated(
              itemCount: favs.length,
              separatorBuilder: (_, __) => const Divider(),
              itemBuilder: (context, i) {
                final meal = favs[i];
                return ListTile(
                  leading: CircleAvatar(
                      backgroundImage: NetworkImage(meal.thumbnail)),
                  title: Text(meal.name),
                  subtitle: Text('${meal.category} • ${meal.area}'),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () => _openDetail(meal),
                );
              },
            ),
    );
  }
}
