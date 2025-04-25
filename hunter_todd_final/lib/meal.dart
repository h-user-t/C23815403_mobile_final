class Meal {
  final String id;
  final String name;
  final String category;
  final String area;
  final String instructions;
  final String thumbnail;
  final String tags;
  final String youtube;
  final Map<String, String> ingredients;

  Meal({
    required this.id,
    required this.name,
    required this.category,
    required this.area,
    required this.instructions,
    required this.thumbnail,
    required this.tags,
    required this.youtube,
    required this.ingredients,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    final ings = <String, String>{};
    for (var i = 1; i <= 20; i++) {
      final ing  = json['strIngredient$i'];
      final meas = json['strMeasure$i'];
      if (ing != null && ing.toString().isNotEmpty) ings[ing] = meas ?? '';
    }
    return Meal(
      id:           json['idMeal'],
      name:         json['strMeal'],
      category:     json['strCategory'],
      area:         json['strArea'],
      instructions: json['strInstructions'],
      thumbnail:    json['strMealThumb'],
      tags:         json['strTags'] ?? '',
      youtube:      json['strYoutube'] ?? '',
      ingredients:  ings,
    );
  }

  @override
  bool operator ==(Object other) => other is Meal && other.id == id;
  @override
  int get hashCode => id.hashCode;
}
