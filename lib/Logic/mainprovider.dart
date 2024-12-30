import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../Models/mainscreenmodel.dart';

class MainProvider extends ChangeNotifier {
  List<PokemonResult> listofpokemon = [];
  List<PokemonDetails> pokemondetails = [];// Change from Map to List

  Future<List<PokemonResult>> fetchPokemonList() async {
    final response = await http.get(
      Uri.parse("https://pokeapi.co/api/v2/pokemon?limit=100000&offset=0"),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> decodedResponse = jsonDecode(response.body);
      final List<dynamic> results = decodedResponse['results'];
      listofpokemon =
          results.map((item) => PokemonResult.fromJson(item)).toList();
      notifyListeners();
      return listofpokemon;



    } else {
      throw Exception('Failed to fetch Pokémon list');
    }
  }
  Future<List<PokemonDetails>> fetchPokemonDetail(String number) async {
    final response = await http.get(
      Uri.parse(number),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> decodedResponse = jsonDecode(response.body);
      final List<dynamic> abilities = decodedResponse['abilities'];
      pokemondetails = abilities
          .map((item) => PokemonDetails.fromJson(item as Map<String, dynamic>))
          .toList();

      notifyListeners();
      return pokemondetails;
    } else {
      throw Exception('Failed to fetch Pokémon details');
    }
  }

}
