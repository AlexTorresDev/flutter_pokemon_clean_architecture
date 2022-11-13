import 'dart:convert';

import 'package:flutter_pokemon_clean_architecture/core/errors/exceptions.dart';
import 'package:flutter_pokemon_clean_architecture/data/models/pokemon_model.dart';
import 'package:http/http.dart' as http;

abstract class RemoteDataSource {
  Future<PokemonModel> getPokemon(String name);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final http.Client client;

  RemoteDataSourceImpl({
    required this.client,
  });

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
