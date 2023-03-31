// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokedex/controller/database_helper.dart';

import 'package:pokedex/model/pokemon.dart';
import 'package:pokedex/view/details_page.dart';

import 'widgets/favorites_widgets/favorite_item.dart';

class Favorites extends StatefulWidget {
  final List<Pokemon> pokemons;
  const Favorites({
    Key? key,
    required this.pokemons,
  }) : super(key: key);

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  List<Pokemon> pokemonsFavorites = [];
  final dbHelper = DatabaseHelper.instance;

  void _getFavorites() {
    pokemonsFavorites = [];
    dbHelper.getAll().then((value) {
      for (var element in value) {
        for (int i = 0; i < widget.pokemons.length; i++) {
          if (widget.pokemons[i].num == element.numRef) {
            pokemonsFavorites.add(widget.pokemons[i]);
          }
        }
      }
      setState(() {});
    });
  }

  @override
  void initState() {
    _getFavorites();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
        title: const Text(
          'Favoritos',
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: pokemonsFavorites.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsPage(
                  pokemon: pokemonsFavorites[index],
                ),
              ),
            ).then((value) {
              _getFavorites();
            }),
            child: FavoriteItem(
                pokemonsFavorites: pokemonsFavorites, index: index),
          );
        },
      ),
    );
  }
}
