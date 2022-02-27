import 'dart:ffi';

class Recipe {
  String? name;
  String? description;
  double? duration;
  List<String>? ingredients;
  List<String>? steps;

  Recipe({
    this.name,
    this.description,
    this.duration,
    this.ingredients,
    this.steps,
  });
}
