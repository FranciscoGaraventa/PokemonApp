import '../entities/pokemon.dart';

abstract class IDatabasePokemonRepository {
  Future<List<Pokemon>> getFavoritesPokemon();

  Future<void> savePokemon({required Pokemon pokemon});

  Future<void> removePokemon({required Pokemon pokemon});

  Future<bool> existPokemonSaved({required int id});
}
