import 'package:flutter/material.dart';
import '/api_service.dart';
import '/meal.dart';
import 'recipe_detail_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _ctrl = TextEditingController();
  List<Meal>? _results;
  bool _loading = false;

  Future<void> _search() async {
    setState(() => _loading = true);
    final data = await ApiService.searchMeals(_ctrl.text);
    setState(() {
      _results = data;
      _loading = false;
    });
  }

  Future<void> _openDetail(Meal m) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => RecipeDetailPage(meal: m)),
    );
    // no need to refresh here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search Recipes')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _ctrl,
              decoration: const InputDecoration(
                labelText: 'Enter meal name',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.search),
              ),
              onSubmitted: (_) => _search(),
            ),
            const SizedBox(height: 16),
            if (_loading) const CircularProgressIndicator(),
            if (_results != null)
              Expanded(
                child: _results!.isEmpty
                    ? const Center(child: Text('No recipes found.'))
                    : ListView.builder(
                        itemCount: _results!.length,
                        itemBuilder: (context, i) {
                          final meal = _results![i];
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(meal.thumbnail),
                            ),
                            title: Text(meal.name),
                            onTap: () => _openDetail(meal),
                          );
                        },
                      ),
              ),
          ],
        ),
      ),
    );
  }
}
