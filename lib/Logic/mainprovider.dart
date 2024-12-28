

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class MainProvider extends ChangeNotifier{

  Map<dynamic, dynamic> listofpokemon ={};

  Future<Map<dynamic, dynamic>> fetchlist() async {
    var data = await http.get(Uri.parse("https://pokeapi.co/api/v2/pokemon/"));
    Map<dynamic, dynamic> decodedResponse = jsonDecode(data.body) as Map;
    return decodedResponse;
  }

}