import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pokedex/constants.dart';
import 'package:pokedex/model/pokemon.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex/model/types_pokemon.dart';
import 'package:pokedex/model/weaknesses_pokemon.dart';

class DataRetrieve {
  String url =
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';

  List<TypePokemon> typePoke = [];
  List<WeaknessesPokemon> weaknessesPoke = [];

  Future<List<Pokemon>> pokemonDataRetrieve() async {
    http.Response response = await http.get(Uri.parse(url));

    final listPokemons = <Pokemon>[];

    Map map = json.decode(response.body);

    for (int i = 0; i < (map['pokemon'] as List<dynamic>).length; i++) {
      listPokemons.add(
        Pokemon(
          map['pokemon'][i]['id'],
          map['pokemon'][i]['num'],
          map['pokemon'][i]['name'],
          map['pokemon'][i]['img'],
          typeDataRetrieve(map, i),
          map['pokemon'][i]['height'],
          map['pokemon'][i]['weight'],
          map['pokemon'][i]['candy'],
          map['pokemon'][i]['egg'],
          map['pokemon'][i]['spawn_chance'].toString(),
          map['pokemon'][i]['avg_spawns'].toString(),
          map['pokemon'][i]['spawn_time'],
          weaknessesDataRetrieve(map, i),
          getColorByType(typeDataRetrieve(map, i)),
        ),
      );
    }
    return listPokemons;
  }

  Future<List<Pokemon>> pokemonDataRetrieveFiltered(
      Map<String, bool> mapFilter) async {
    http.Response response = await http.get(Uri.parse(url));

    final listPokemons = <Pokemon>[];

    Map map = json.decode(response.body);

    for (int i = 0; i < (map['pokemon'] as List<dynamic>).length; i++) {
      for (int j = 0; j < typeDataRetrieve(map, i).length; j++) {
        if (mapFilter[typeDataRetrieve(map, i)[j].typeName.toLowerCase()] ==
            true) {
          listPokemons.add(
            Pokemon(
              map['pokemon'][i]['id'],
              map['pokemon'][i]['num'],
              map['pokemon'][i]['name'],
              map['pokemon'][i]['img'],
              typeDataRetrieve(map, i),
              map['pokemon'][i]['height'],
              map['pokemon'][i]['weight'],
              map['pokemon'][i]['candy'],
              map['pokemon'][i]['egg'],
              map['pokemon'][i]['spawn_chance'].toString(),
              map['pokemon'][i]['avg_spawns'].toString(),
              map['pokemon'][i]['spawn_time'],
              weaknessesDataRetrieve(map, i),
              getColorByType(typeDataRetrieve(map, i)),
            ),
          );
        }
      }
    }
    return listPokemons;
  }

  List<TypePokemon> typeDataRetrieve(Map pokeMap, int index) {
    typePoke = [];

    for (int i = 0;
        i < (pokeMap['pokemon'][index]['type'] as List<dynamic>).length;
        i++) {
      typePoke.add(TypePokemon(i, pokeMap['pokemon'][index]['type'][i]));
    }
    return typePoke;
  }

  List<WeaknessesPokemon> weaknessesDataRetrieve(Map pokeMap, int index) {
    weaknessesPoke = [];

    for (int i = 0;
        i < (pokeMap['pokemon'][index]['weaknesses'] as List<dynamic>).length;
        i++) {
      weaknessesPoke.add(
          WeaknessesPokemon(i, pokeMap['pokemon'][index]['weaknesses'][i]));
    }
    return weaknessesPoke;
  }

  Color getColorByType(List<TypePokemon> pokemonTypes) {
    return colorGeneratorsssss(pokemonTypes[0].typeName.toLowerCase());
  }
}
