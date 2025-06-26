import 'package:flutter_pokemon_clean_architecture/src/core/connections/db_provider.dart';
import 'package:flutter_pokemon_clean_architecture/src/domain/models/pokemon.dart';
import 'package:flutter_pokemon_clean_architecture/src/domain/models/sprite.dart';
import 'package:sqflite/sqflite.dart';

abstract class LocalDataSource {
  Future<List<PokemonModel>> getPokemonList(int limit, int offset);
  Future<List<PokemonModel>> getPokemon(String name);
  void savePokemonList(List<PokemonModel> pokemonList) {}
}

class LocalDataSourceImpl implements LocalDataSource {
  LocalDataSourceImpl({required this.dbProvider});

  final DBProvider? dbProvider;

  @override
  Future<List<PokemonModel>> getPokemonList(int limit, int offset) async {
    final database = await dbProvider!.database;
    final pokemons = await database!.query(
      'pokemon',
      limit: limit,
      offset: offset,
    );
    return _getPokemonsWithSprites(database, pokemons);
  }

  @override
  Future<List<PokemonModel>> getPokemon(String name) async {
    final database = await dbProvider!.database;
    final pokemons = await database!.query(
      'pokemon',
      where: 'name LIKE ?',
      whereArgs: ['%$name%'],
    );

    return _getPokemonsWithSprites(database, pokemons);
  }

  @override
  void savePokemonList(List<PokemonModel> pokemonList) async {
    final database = await dbProvider!.database;

    for (final pokemon in pokemonList) {
      await database!.insert(
        'pokemon',
        pokemon.toJson()..remove('sprites'),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      await database.delete(
        'sprites',
        where: 'pokemon_id = ?',
        whereArgs: [pokemon.id],
      );

      for (final sprite in pokemon.sprites) {
        await database.insert('sprites', {
          'pokemon_id': pokemon.id,
          'type': sprite.type,
          'key': sprite.key,
          'value': sprite.value,
        }, conflictAlgorithm: ConflictAlgorithm.replace);
      }
    }
  }

  Future<List<PokemonModel>> _getPokemonsWithSprites(
    Database database,
    List<Map<String, dynamic>> pokemons,
  ) async {
    List<PokemonModel> pokemonsWithSprites = [];

    for (final pokemon in pokemons) {
      final sprites = await database.query(
        'sprites',
        where: 'pokemon_id = ?',
        whereArgs: [pokemon['id']],
      );
      final spritesList = sprites
          .map(
            (e) => SpriteModel.fromJson({
              'type': e['type'],
              'key': e['key'],
              'value': e['value'],
            }),
          )
          .toList();

      pokemonsWithSprites.add(
        PokemonModel.fromJson({...pokemon, 'sprites': spritesList}),
      );
    }
    return pokemonsWithSprites;
  }
}
