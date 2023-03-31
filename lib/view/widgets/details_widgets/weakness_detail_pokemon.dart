import 'package:flutter/material.dart';
import 'package:pokedex/constants.dart';
import 'package:pokedex/model/pokemon.dart';

class WeaknessDetailPokemon extends StatelessWidget {
  const WeaknessDetailPokemon({
    super.key,
    required this.pokemon,
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 25.0, bottom: 15),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              'Weaknesses',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ),
        ),
        SizedBox(
          height: 40,
          width: double.infinity,
          child: Align(
            alignment: Alignment.center,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: pokemon.weaknesses.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5.0),
                  child: Chip(
                    label: Text(
                      pokemon.weaknesses[index].type,
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    backgroundColor: colorGeneratorsssss(
                      pokemon.weaknesses[index].type.toLowerCase(),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
