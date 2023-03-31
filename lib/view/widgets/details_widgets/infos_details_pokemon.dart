import 'package:flutter/material.dart';
import 'package:pokedex/model/pokemon.dart';

class InfosDetailsPokemon extends StatelessWidget {
  const InfosDetailsPokemon({
    super.key,
    required this.pokemon,
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  pokemon.weight.toUpperCase(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 25),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'Weight',
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 18),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  pokemon.height.toUpperCase(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 25),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text('Height',
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 18)),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 25,
        ),
        SizedBox(
          height: 130,
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Candy',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Egg',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Spawn Chance',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'AVG Spwns',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Spawn Time',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      pokemon.candy,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      pokemon.egg,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      pokemon.spawnChance,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      pokemon.avgSpwns,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      pokemon.spawnTime,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
