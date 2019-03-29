import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'drink.dart';

class API {

  static final String urlDrinksAlcoholic = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Alcoholic";
  static final String urlDrinksNonAlcoholic = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Alcoholic";

  Future<Iterable<Drink>> fetchDrinkList() async {
    final response =
    await http.get('https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Alcoholic');

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      var responseJson = json.decode(response.body);
      return (responseJson['drinks'] as List)
          .map((p) => Drink.fromJson(p))
          .toList();
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<Drink> fetchDrinkById(final String id) async {
    final response =
    await http.get('https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=$id');

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      var responseJson = json.decode(response.body);
      return (responseJson['drinks'] as List)
          .map((p) => Drink.fromJson2(p))
          .toList().first;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
}