import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_flutter/bloc/pokemon_bloc.dart';
import 'package:pokemon_flutter/models/pokemon.dart';
import 'package:pokemon_flutter/utils/constants.dart';

class DetailsScreen extends StatelessWidget {
  final Pokemon pokemonDetail;

  const DetailsScreen({Key? key, required this.pokemonDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(pokemonDetail.weight);
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var type = pokemonDetail.type[0];
    var colors = handleColors(type);
    return Scaffold(
      backgroundColor: colors,
      body: Stack(
        children: [
          Positioned(
            top: 50,
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  size: 25,
                  color: Colors.black,
                )),
          ),
          Positioned(
            top: 100,
            left: 15,
            child: Text(
              pokemonDetail.name,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 32.0),
            ),
          ),
          Positioned(
            top: 150,
            left: 15,
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.black26),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 8.0, right: 8.0, bottom: 4.0, top: 4.0),
                child: Text(
                  (pokemonDetail.type).join(', '),
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Positioned(
            top: height * 0.20,
            right: -35,
            child: Image.asset(
              'assets/pokeball.png',
              width: 200,
              fit: BoxFit.fitHeight,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: width,
              height: height * 0.6,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: width * 0.3,
                            child: const Text(
                              'Nome: ',
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            width: width * 0.3,
                            child: Text(
                              pokemonDetail.name,
                              style: const TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: width * 0.3,
                            child: const Text(
                              'Peso: ',
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            width: width * 0.3,
                            child: Text(
                              pokemonDetail.weight,
                              style: const TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: width * 0.3,
                            child: const Text(
                              'Altura: ',
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            width: width * 0.3,
                            child: Text(
                              pokemonDetail.height,
                              style: const TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: width * 0.3,
                            child: const Text(
                              'Região: ',
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            width: width * 0.3,
                            child: const Text(
                              'Kanto',
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: height * 0.15,
            left: (width / 4) + 60,
            child: Image.network(
              pokemonDetail.img,
              height: 200,
              fit: BoxFit.fitHeight,
            ),
          ),
        ],
      ),
    );
  }
}
