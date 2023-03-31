import 'package:flutter/material.dart';
import 'package:pokedex/data/data_retrieve.dart';
import 'package:pokedex/view/home_page.dart';
import 'package:provider/provider.dart';

import 'controller/data_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => DataProvider([]),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    DataRetrieve dataRetrieve = DataRetrieve();

    dataRetrieve.pokemonDataRetrieve().then((value) {
      Provider.of<DataProvider>(context, listen: false).updateData(value);
    });

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
