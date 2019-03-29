class Drink {
  final String id;
  final String name;
  final String thumb;
  final String category;
  final String glass;
  final String instructions;
  final String ingredient1;
  final String measure1;

  Drink({this.id, this.name, this.thumb, this.category, this.glass, this.instructions, this.ingredient1, this.measure1});

  factory Drink.fromJson(Map<String, dynamic> json) {
    return Drink(id: json['idDrink'], name: json['strDrink'], thumb: json['strDrinkThumb']);
  }

  factory Drink.fromJson2(Map<String, dynamic> json) {
    return Drink(id: json['idDrink'], name: json['strDrink'], thumb: json['strDrinkThumb'], category: json['strCategory'], glass: json['strGlass'], instructions: json['strInstructions'], ingredient1: json['strIngredient1'], measure1: json['strMeasure1']);
  }
}