//import 'dart:convert';

//import 'package:flutter_pokemon_clean_architecture/core/errors/exceptions.dart';
import 'package:flutter_pokemon_clean_architecture/data/models/pokemon_model.dart';
import 'package:http/http.dart' as http;

abstract class LocalDataSource {
  Future<PokemonModel> getPokemon(String name);
}

class LocalDataSourceImpl implements LocalDataSource {
  final http.Client client;

  LocalDataSourceImpl({
    required this.client,
  });

  @override
  Future<PokemonModel> getPokemon(String name) async {
    return Future.value(const PokemonModel());
  }
}
