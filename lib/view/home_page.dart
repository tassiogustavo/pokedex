import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokedex/constants.dart';
import 'package:pokedex/data/data_retrieve.dart';
import 'package:pokedex/view/favorites.dart';
import 'package:provider/provider.dart';

import 'package:pokedex/controller/data_provider.dart';

import 'widgets/home_page_widgets/card_list_pokemon.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DataRetrieve dataRetrieve = DataRetrieve();

  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            systemOverlayStyle:
                const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
            title: const Text(
              'Pokedex',
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Favorites(
                        pokemons: value.pokemons,
                      ),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.favorite_border,
                  color: Colors.red,
                ),
              ),
              IconButton(
                onPressed: () {
                  showDialog<String>(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text('Filter by type'),
                          content: StatefulBuilder(
                            builder: (context, setState) {
                              return SizedBox(
                                width: 250,
                                height: 400,
                                child: ListView(
                                  children: valuesFilter.keys.map((key) {
                                    return CheckboxListTile(
                                      title: Text(key),
                                      value: valuesFilter[key],
                                      onChanged: (value) {
                                        setState(() {
                                          valuesFilter[key] = value!;
                                        });
                                      },
                                    );
                                  }).toList(),
                                ),
                              );
                            },
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                dataRetrieve
                                    .pokemonDataRetrieveFiltered(valuesFilter)
                                    .then((value) {
                                  Provider.of<DataProvider>(context,
                                          listen: false)
                                      .updateData(value);
                                });

                                setState(() {});

                                Navigator.pop(context, 'OK');
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      });
                },
                icon: const Icon(
                  Icons.filter_list,
                  color: Colors.black,
                ),
              ),
            ],
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: value.pokemons.length,
              itemBuilder: (context, index) {
                return CardListPokemon(
                  data: value,
                  index: index,
                );
              },
            ),
          ),
        );
      },
    );
  }
}
