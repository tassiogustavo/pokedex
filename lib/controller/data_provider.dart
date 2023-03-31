
import 'package:flutter/material.dart';
import 'package:pokedex/model/pokemon.dart';

class DataProvider extends ChangeNotifier {
  List<Pokemon> pokemons;

  DataProvider(this.pokemons);

  void updateData(List<Pokemon> pokemons) {
    this.pokemons = pokemons;
    notifyListeners();
  }
}
