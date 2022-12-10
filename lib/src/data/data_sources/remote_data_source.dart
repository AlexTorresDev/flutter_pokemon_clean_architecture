import 'dart:convert';

import 'package:flutter_pokemon_clean_architecture/src/core/errors/exceptions.dart';
import 'package:flutter_pokemon_clean_architecture/src/core/framework/utils/constants.dart';
import 'package:flutter_pokemon_clean_architecture/src/data/models/pokemon_model.dart';
import 'package:http/http.dart' as http;

abstract class RemoteDataSource {
  Future<List<PokemonModel>> getPokemonList(int limit, int offset);
  Future<List<PokemonModel>> getPokemon(String name);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  RemoteDataSourceImpl({
    required this.client,
  });

  final http.Client client;

  @override
  Future<List<PokemonModel>> getPokemonList(int limit, int offset) async {
    final response =
        await client.get(Uri.parse('$baseURL?limit=$limit&offset=$offset'));

    if (response.statusCode == 200) {
      final results = json.decode(response.body)['results'] as List;
      final List<PokemonModel> pokemonList = [];

      for (var i = 0; i < results.length; i++) {
        pokemonList.add((await getPokemon(results[i]['name']))[0]);
      }

      return pokemonList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<PokemonModel>> getPokemon(String name) async {
    final response = await client.get(Uri.parse('$baseURL/$name'));

    if (response.statusCode == 200) {
      return [PokemonModel.fromJson(json.decode(response.body))];
    } else {
      throw ServerException();
    }
  }
}
