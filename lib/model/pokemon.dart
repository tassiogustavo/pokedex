import 'package:flutter/material.dart';
import 'package:pokedex/model/types_pokemon.dart';
import 'package:pokedex/model/weaknesses_pokemon.dart';

class Pokemon {
  int id;
  String num;
  String name;
  String image;
  List<TypePokemon> types;
  String height;
  String weight;
  String candy;
  String egg;
  String spawnChance;
  String avgSpwns;
  String spawnTime;
  List<WeaknessesPokemon> weaknesses;
  Color color;

  Pokemon(
      this.id,
      this.num,
      this.name,
      this.image,
      this.types,
      this.height,
      this.weight,
      this.candy,
      this.egg,
      this.spawnChance,
      this.avgSpwns,
      this.spawnTime,
      this.weaknesses,
      this.color);
}
