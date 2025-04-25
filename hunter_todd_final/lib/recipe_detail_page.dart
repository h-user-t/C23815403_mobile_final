import 'package:flutter/material.dart';

import '/meal.dart';
import '/favorites_store.dart';
import '/customcard.dart';

class RecipeDetailPage extends StatefulWidget {
  final Meal meal;
  const RecipeDetailPage({super.key, required this.meal});

  @override
  State<RecipeDetailPage> createState() => _RecipeDetailPageState();
}

class _RecipeDetailPageState extends State<RecipeDetailPage> {
  final favStore = FavoritesStore.instance;
  bool _changed = false;


  void _close() => Navigator.pop(context, _changed);

  @override
  Widget build(BuildContext context) {
    final isFav = favStore.isFavorite(widget.meal);

    return PopScope(

      canPop: true,
      onPopInvokedWithResult: (bool didPop, Object? _) {
        if (!didPop) {
          Navigator.pop(context, _changed);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: _close,
          ),
          title: Text(widget.meal.name),
          actions: [
            IconButton(
              icon: Icon(isFav ? Icons.favorite : Icons.favorite_border),
              onPressed: () {
                setState(() {
                  favStore.toggle(widget.meal);
                  _changed = true;
                });
              },
            ),
          ],
        ),
        body: SingleChildScrollView(child: CustomCard(widget.meal)),
      ),
    );
  }
}
