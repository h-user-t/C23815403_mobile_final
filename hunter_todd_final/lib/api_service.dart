import 'dart:convert';
import 'package:http/http.dart' as http;
import '/meal.dart';

class ApiService {
  static const _base = 'https://www.themealdb.com/api/json/v1/1';

  static Future<List<Meal>> fetchRandomMeals(int n) async {
    final meals = <Meal>[];
    for (var i = 0; i < n; i++) {
      final res  = await http.get(Uri.parse('$_base/random.php'));
      final json = jsonDecode(res.body);
      meals.add(Meal.fromJson(json['meals'][0]));
    }
    return meals;
  }

  static Future<List<Meal>> searchMeals(String query) async {
    final res  = await http.get(Uri.parse('$_base/search.php?s=$query'));
    final json = jsonDecode(res.body);
    if (json['meals'] == null) return [];
    return (json['meals'] as List).map((e) => Meal.fromJson(e)).toList();
  }
}
