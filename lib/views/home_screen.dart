import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_flutter/bloc/pokemon_bloc.dart';
import 'package:pokemon_flutter/models/pokemon.dart';
import 'package:pokemon_flutter/models/pokemon_response.dart';
import 'package:pokemon_flutter/utils/constants.dart';
import 'package:pokemon_flutter/views/details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -40,
            right: -50,
            child: Image.asset(
              'assets/pokeball.png',
              width: 200,
            ),
          ),
          const Positioned(
            top: 100,
            left: 20,
            child: Text(
              'Pokedéx',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28.0,
              ),
            ),
          ),
          Positioned(
            top: 150,
            bottom: 0,
            width: width,
            child: BlocBuilder<PokemonBloc, PokemonState>(
              builder: (context, state) {
                if (state is PokemonInitial) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is PokemonsLoaded) {
                  Pokedex pokedex = Pokedex(state.pokedex.pokemonList);
                  print(state.pokedex.pokemonList.length);
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemCount: state.pokedex.pokemonList.length,
                    itemBuilder: (context, index) {
                      var type = state.pokedex.pokemonList[index].type[0];
                      var colors = handleColors(type);

                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (newContext) => BlocProvider.value(
                              value: BlocProvider.of<PokemonBloc>(context),
                              child: DetailsScreen(
                                pokemonDetail: state.pokedex.pokemonList[index],
                              ),
                            ),
                          ));
                        },
                        onLongPress: () {},
                        child: Card(
                          color: colors,
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: -5,
                                right: -5,
                                child: Image.asset(
                                  'assets/pokeball.png',
                                  height: 100.0,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                              Positioned(
                                bottom: 5,
                                right: 5,
                                child: Image.network(
                                    state.pokedex.pokemonList[index].img),
                              ),
                              Positioned(
                                top: 35,
                                left: 10,
                                child: Text(
                                  state.pokedex.pokemonList[index].name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 20,
                                left: 10,
                                child: Text(
                                    state.pokedex.pokemonList[index].number),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else if (state is PokemonError) {
                  return const Center(
                    child: Text('Erro'),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
