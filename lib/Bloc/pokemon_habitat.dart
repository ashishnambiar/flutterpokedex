import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutterpokedex/Model/pokemonhabitat_model.dart';
import 'package:http/http.dart' as http;

class DataProvider extends ChangeNotifier {
  PokemonHabitatModel _datap = PokemonHabitatModel();
  bool alive = false;

  PokemonHabitatModel get recieveData => _datap;

  Future<PokemonHabitatModel> getData() async {
    alive = true;
    var url = "https://pokeapi.co/api/v2/pokemon-habitat/";
    var response = await http.get(Uri.parse(url));
    print(response.body);
    Map<String, dynamic> json = jsonDecode(response.body);
    _datap = PokemonHabitatModel.fromJson(json);
    notifyListeners();
    return _datap;
  }
}
