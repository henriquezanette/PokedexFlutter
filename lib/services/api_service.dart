import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pokemon_flutter/models/pokemon.dart';
import 'package:pokemon_flutter/models/pokemon_response.dart';

class ApiService {
  final Dio _dio = Dio();

  final String baseUrl = 'https://raw.githubusercontent.com';

  Future<Pokedex> getPokemons() async {
    try {
      var url =
          'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';
      print('Start Request');
      var dio = Dio();
      final response = await dio.get(url);
      var body = jsonDecode(response.data);
      var pokedex = Pokedex.fromJson(body);

      pokedex.pokemonList.forEach((pokemon) {
        print(
            '#${pokemon.number} - ${pokemon.name} ${pokemon.type} - ${pokemon.isFavorite}');
      });

      print('Finish Request');
      return pokedex;
    } catch (error, stacktrace) {
      //print(stacktrace);
      throw Exception('Ocorreu uma excessão $error com stacktrace:$stacktrace');
    }
  }
}
