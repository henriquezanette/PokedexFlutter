import 'package:pokemon_flutter/models/pokemon.dart';

class Pokedex {
  List<Pokemon> pokemonList;

  Pokedex(this.pokemonList);

  Pokedex.fromJson(Map<String, dynamic> json)
      : pokemonList =
            (json['pokemon'] as List).map((e) => Pokemon.fromJson(e)).toList();
}
