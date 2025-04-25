import 'package:flutter/material.dart';
import '/api_service.dart';
import '/meal.dart';
import '/favorites_store.dart';
import '/recipe_detail_page.dart';

class RecipeListPage extends StatefulWidget {
  const RecipeListPage({super.key});

  @override
  State<RecipeListPage> createState() => _RecipeListPageState();
}

class _RecipeListPageState extends State<RecipeListPage> {
  late Future<List<Meal>> _future;

  @override
  void initState() {
    super.initState();
    _future = ApiService.fetchRandomMeals(10);
  }

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
    final favStore = FavoritesStore.instance;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Recipes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => Navigator.pushNamed(context, '/search'),
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              setState(() => _future = ApiService.fetchRandomMeals(10));
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Meal>>(
        future: _future,
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snap.hasError) {
            return Center(child: Text('Error: ${snap.error}'));
          }
          final meals = snap.data!;
          return ListView.separated(
            itemCount: meals.length,
            separatorBuilder: (_, __) => const Divider(),
            itemBuilder: (context, i) {
              final meal = meals[i];
              return ListTile(
                leading: CircleAvatar(backgroundImage: NetworkImage(meal.thumbnail)),
                title: Text(meal.name),
                subtitle: Text('${meal.category} • ${meal.area}'),
                trailing: IconButton(
                  icon: Icon(
                  favStore.isFavorite(meal) ? Icons.favorite : Icons.favorite_border,
                  color: Colors.teal,
                ),
                tooltip: 'Save as a favorite',
                onPressed: () {
                  setState(() {
                    favStore.toggle(meal);
                  });
                },
                ),
                onTap: () => _openDetail(meal),
              );
            },
          );
        },
      ),
    );
  }
}
