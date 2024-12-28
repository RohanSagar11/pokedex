import 'package:flutter/material.dart';
import 'package:pokedex/Screens/mainscreen.dart';
import 'package:pokedex/constants/colors.dart';
import 'package:provider/provider.dart';

import 'Logic/mainprovider.dart';
import 'Screens/pokemonscreendetails.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MainProvider()),
      ],
      child: const MyApp(),
    ),
  );



}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Pokedex',
      theme: ThemeData(
        primaryColor: primary,
        colorScheme: ColorScheme.fromSeed(seedColor: primary),
        useMaterial3: true,
      ),
      home: const PokemonScreenDetails(),
    );
  }
}

