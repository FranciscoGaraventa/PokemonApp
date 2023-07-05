import 'package:floor/floor.dart';

import '../../../core/resources/env.dart';
import '../../../domain/entities/pokemon.dart';

@dao
abstract class PokemonDao {
  @Query('SELECT * FROM ${Env.databaseName}')
  Future<List<Pokemon>> getFavoritesPokemon();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertPokemon(Pokemon pokemon);

  @delete
  Future<void> deletePokemon(Pokemon pokemon);

  @Query('SELECT * FROM ${Env.databaseName} WHERE id = :id')
  Future<Pokemon?> existPokemon(int id);
}
