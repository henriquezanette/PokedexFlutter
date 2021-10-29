import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_flutter/bloc/pokemon_bloc.dart';
import 'package:pokemon_flutter/models/pokemon.dart';
import 'package:pokemon_flutter/views/details_screen.dart';
import 'package:pokemon_flutter/views/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PokemonBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocProvider<PokemonBloc>(
          create: (context) =>
              PokemonBloc()..add(const PokemonEventStarted(0, '')),
          child: const HomeScreen(),
        ),
        initialRoute: '/',
      ),
    );
  }
}
