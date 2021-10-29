part of 'pokemon_bloc.dart';

abstract class PokemonEvent extends Equatable {
  const PokemonEvent();

  @override
  List<Object> get props => [];
}

class PokemonEventStarted extends PokemonEvent {
  final int pokemonId;
  final String query;

  const PokemonEventStarted(this.pokemonId, this.query);

  @override
  List<Object> get props => [pokemonId, query];
}
