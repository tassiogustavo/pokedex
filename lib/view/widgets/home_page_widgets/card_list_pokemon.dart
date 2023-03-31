import 'package:flutter/material.dart';
import 'package:pokedex/controller/data_provider.dart';
import 'package:pokedex/view/details_page.dart';

// ignore: must_be_immutable
class CardListPokemon extends StatelessWidget {
  DataProvider data;
  int index;
  CardListPokemon({
    Key? key,
    required this.data,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsPage(
                pokemon: data.pokemons[index],
              ),
            ),
          );
        },
        child: Hero(
          tag: 'dash${data.pokemons[index].id}',
          child: Card(
            color: data.pokemons[index].color,
            child: Column(
              children: [
                Image.network(data.pokemons[index].image),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    data.pokemons[index].name,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
