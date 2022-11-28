import 'package:flutter_pokemon_clean_architecture/core/connections/db_provider.dart';
import 'package:flutter_pokemon_clean_architecture/data/models/pokemon_model.dart';
import 'package:sqflite/sqflite.dart';

abstract class LocalDataSource {
  Future<List<PokemonModel>> getPokemonList();
  Future<List<PokemonModel>> getPokemon(String name);
  void savePokemonList(List<PokemonModel> pokemonList) {}
}

class LocalDataSourceImpl implements LocalDataSource {
  final DBProvider? dbProvider;

  LocalDataSourceImpl({
    required this.dbProvider,
  });

  @override
  Future<List<PokemonModel>> getPokemonList() async {
    final database = await dbProvider!.database;
    final maps = await database!.query('pokemon');

    if (maps.isNotEmpty) {
      return maps.map((e) => PokemonModel.fromJson(e)).toList();
    } else {
      return Future.value([]);
    }
  }

  @override
  Future<List<PokemonModel>> getPokemon(String name) async {
    final database = await dbProvider!.database;
    final maps = await database!.query(
      'pokemon',
      where: 'name LIKE ?',
      whereArgs: ['%$name%'],
    );

    if (maps.isNotEmpty) {
      return maps.map((e) => PokemonModel.fromJson(e)).toList();
    } else {
      return Future.value([]);
    }
  }

  @override
  void savePokemonList(List<PokemonModel> pokemonList) async {
    final database = await dbProvider!.database;

    for (final pokemon in pokemonList) {
      await database!.insert(
        'pokemon',
        pokemon.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  }
}
