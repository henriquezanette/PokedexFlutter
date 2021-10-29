import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pokemon_flutter/models/pokemon.dart';
import 'package:pokemon_flutter/models/pokemon_response.dart';
import 'package:pokemon_flutter/services/api_service.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc() : super(PokemonInitial());

  @override
  Stream<PokemonState> mapEventToState(PokemonEvent event) async* {
    if (event is PokemonEventStarted) {
      yield* _mapPokemonEventStateToState(event.pokemonId, event.query);
    }
  }

  Stream<PokemonState> _mapPokemonEventStateToState(
      int pokemonId, String query) async* {
    final service = ApiService();

    yield PokemonInitial();

    try {
      List<Pokemon> pokemonList = [];
      Pokedex pokedex = Pokedex(pokemonList);
      if (pokemonId == 0) {
        pokedex = (await service.getPokemons());
      }

      yield PokemonsLoaded(pokedex);
    } on Exception catch (e) {
      print(e);
      yield PokemonError();
    }
  }
}
