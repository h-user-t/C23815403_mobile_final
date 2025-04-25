import '/meal.dart';

class FavoritesStore {
  FavoritesStore._();
  static final FavoritesStore instance = FavoritesStore._();

  final List<Meal> _favs = [];

  List<Meal> get favorites => List.unmodifiable(_favs);

  bool isFavorite(Meal m) => _favs.any((e) => e.id == m.id);
  bool toggle(Meal m) {
    if (isFavorite(m)) {
      _favs.removeWhere((e) => e.id == m.id);
      return true;
    } else {
      _favs.add(m);
      return true;
    }
  }
}
