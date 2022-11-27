import 'package:flutter_pokemon_clean_architecture/core/errors/exceptions.dart';
import 'package:flutter_pokemon_clean_architecture/data/database.dart';
import 'package:flutter_pokemon_clean_architecture/data/models/pokemon_model.dart';
import 'package:sqflite/sqflite.dart';

abstract class LocalDataSource {
  Future<List<PokemonModel>> getPokemonList();
  Future<PokemonModel> getPokemon(String name);
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
  Future<PokemonModel> getPokemon(String name) async {
    final database = await dbProvider!.database;
    final maps = await database!.query(
      'pokemon',
      where: 'name = ?',
      whereArgs: [name],
    );

    if (maps.isNotEmpty) {
      return PokemonModel.fromJson(maps.first);
    } else {
      throw CacheException();
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
