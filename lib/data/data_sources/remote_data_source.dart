import 'dart:convert';

import 'package:flutter_pokemon_clean_architecture/core/errors/exceptions.dart';
import 'package:flutter_pokemon_clean_architecture/data/models/pokemon_model.dart';
import 'package:http/http.dart' as http;

abstract class RemoteDataSource {
  Future<List<PokemonModel>> getPokemonList();
  Future<PokemonModel> getPokemon(String name);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;

  RemoteDataSourceImpl({
    required this.client,
  });

  @override
  Future<List<PokemonModel>> getPokemonList() async {
    final response = await client
        .get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=10'));

    if (response.statusCode == 200) {
      final results = json.decode(response.body)['results'] as List;
      final List<PokemonModel> pokemonList = [];

      for (var i = 0; i < results.length; i++) {
        pokemonList.add(await getPokemon(results[i]['name']));
      }

      return pokemonList;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<PokemonModel> getPokemon(String name) async {
    final response =
        await client.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$name'));

    if (response.statusCode == 200) {
      return PokemonModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
