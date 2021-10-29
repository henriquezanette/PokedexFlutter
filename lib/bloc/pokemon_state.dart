part of 'pokemon_bloc.dart';

abstract class PokemonState extends Equatable {
  const PokemonState();

  @override
  List<Object> get props => [];
}

class PokemonInitial extends PokemonState {}

class PokemonsLoaded extends PokemonState {
  final Pokedex pokedex;

  //final List<Pokemon> pokemonList;

  const PokemonsLoaded(this.pokedex);

  @override
  List<Object> get props => [pokedex];
}

class PokemonError extends PokemonState {}
