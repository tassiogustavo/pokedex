import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokedex/controller/database_helper.dart';
import 'package:pokedex/model/favorites_model.dart';
import 'package:pokedex/model/pokemon.dart';

import 'widgets/details_widgets/infos_details_pokemon.dart';
import 'widgets/details_widgets/top_infos_datils_pokemon.dart';
import 'widgets/details_widgets/weakness_detail_pokemon.dart';

class DetailsPage extends StatefulWidget {
  final Pokemon pokemon;
  const DetailsPage({super.key, required this.pokemon});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  List<String> listFavorites = [];
  final dbHelper = DatabaseHelper.instance;
  bool isFavorite = false;

  void checkIsFavorite() {
    dbHelper.getFavoriteItem(widget.pokemon.num).then((value) {
      if (value == null) {
        setState(() {
          isFavorite = false;
        });
      } else {
        setState(() {
          isFavorite = true;
        });
      }
    });
  }

  @override
  void initState() {
    checkIsFavorite();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.pokemon.color,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              if (isFavorite) {
                dbHelper.delete(widget.pokemon.num);
                setState(() {
                  isFavorite = false;
                });
              } else {
                dbHelper.insert(FavoriteModel(
                    numRef: widget.pokemon.num, isFavorite: 'true'));
                setState(() {
                  isFavorite = true;
                });
              }
            },
            icon: isFavorite
                ? const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )
                : const Icon(Icons.favorite_border_outlined),
          ),
        ],
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 330,
              width: double.infinity,
              child: TopInfosDetailsPokemon(pokemon: widget.pokemon),
            ),
            Container(
              height: 400,
              color: Colors.white,
              child: Column(
                children: [
                  InfosDetailsPokemon(pokemon: widget.pokemon),
                  WeaknessDetailPokemon(pokemon: widget.pokemon)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
