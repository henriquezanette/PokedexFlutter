import 'package:flutter/material.dart';

handleColors(String type) {
  Color ground = const Color(0xFFE3C969);
  var cor;
  switch (type) {
    case 'Normal':
      cor = Colors.grey.shade300;
      break;
    case 'Poison':
      cor = Colors.purple;
      break;
    case 'Psychic':
      cor = Colors.pink.shade200;
      break;
    case 'Grass':
      cor = Colors.green.shade300;
      break;
    case 'Ground':
      cor = ground;
      break;
    case 'Ice':
      cor = Colors.lightBlue.shade100;
      break;
    case 'Fire':
      cor = Colors.red;
      break;
    case 'Rock':
      cor = Colors.brown.shade400;
      break;
    case 'Dragon':
      cor = Colors.indigo.shade400;
      break;
    case 'Water':
      cor = Colors.blue;
      break;
    case 'Bug':
      cor = Colors.lime.shade400;
      break;
    case 'Dark':
      cor = Colors.brown.shade400;
      break;
    case 'Fighting':
      cor = Colors.orange.shade600;
      break;
    case 'Ghost':
      cor = Colors.deepPurple.shade300;
      break;
    case 'Steel':
      cor = Colors.grey;
      break;

    case 'Flying':
      cor = Colors.blueGrey.shade200;
      break;

    case 'Fairy':
      cor = Colors.red.shade100;
      break;

    case 'Electric':
      cor = Colors.yellow;
      break;

    default:
      cor = Colors.red;
      break;
  }

  return cor;
}
