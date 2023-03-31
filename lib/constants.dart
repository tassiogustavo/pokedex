import 'package:flutter/material.dart';

Color colorGeneratorsssss(String val) {
  switch (val) {
    case 'grass':
    case 'bug':
      return const Color(0xFF48D0B0);

    case 'fire':
      return const Color(0xFFFB6C6C);

    case 'water':
      return const Color(0xFF7AC7FF);

    case 'normal':
    case 'flying':
      return const Color(0xFFbababa);

    case 'fighting':
      return const Color(0xFFB1736C);

    case 'electric':
    case 'psychic':
      return const Color(0xFFFFCE4B);

    case 'poison':
    case 'ghost':
      return const Color(0xFF9F5BBA);

    case 'ground':
    case 'rock':
      return const Color(0xFFCA8179);

    case 'dark':
      return const Color(0xFF303943);

    case 'fairy':
      return const Color(0xFFEE99AC);
    default:
      return const Color(0xFF7AC7FF);
  }
}

Map<String, bool> valuesFilter = {
  'grass': true,
  'bug': true,
  'fire': true,
  'water': true,
  'normal': true,
  'flying': true,
  'fighting': true,
  'electric': true,
  'psychic': true,
  'poison': true,
  'ghost': true,
  'ground': true,
  'rock': true,
  'dark': true,
  'fairy': true,
};

String makePokeNumber(int num) {
  if (num < 10) {
    return "#00$num";
  } else if (num < 99) {
    return "#0$num";
  } else {
    return "#$num";
  }
}
