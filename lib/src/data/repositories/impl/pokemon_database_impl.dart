import '../../../domain/entities/pokemon.dart';
import '../../../domain/repositories/i_database_pokemon_repository.dart';
import '../../datasources/local/pokemon_database.dart';

class PokemonDatabaseImpl implements IDatabasePokemonRepository {
  const PokemonDatabaseImpl(this._pokemonDB);

  final PokemonDatabase _pokemonDB;

  @override
  Future<List<Pokemon>> getFavoritesPokemon() async =>
      _pokemonDB.pokemonDao.getFavoritesPokemon();

  @override
  Future<void> removePokemon({required Pokemon pokemon}) async {
    _pokemonDB.pokemonDao.deletePokemon(pokemon);
  }

  @override
  Future<void> savePokemon({required Pokemon pokemon}) async {
    _pokemonDB.pokemonDao.insertPokemon(pokemon);
  }

  @override
  Future<bool> existPokemonSaved({required int id}) async {
    return await _pokemonDB.pokemonDao.existPokemon(id) != null;
  }
}
