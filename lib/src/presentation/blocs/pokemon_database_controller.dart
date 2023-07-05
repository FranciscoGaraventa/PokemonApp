import 'package:get/get.dart';

import '../../data/repositories/impl/pokemon_database_impl.dart';
import '../../domain/entities/pokemon.dart';

class PokemonDatabaseController extends GetxController
    with StateMixin<List<Pokemon>> {
  PokemonDatabaseController(
    this._pokemonDatabaseImpl,
  );

  final PokemonDatabaseImpl _pokemonDatabaseImpl;
  final Rx<List<int>> favorites = RxList<int>().obs;

  Future<void> savePokemon({required Pokemon pokemon}) async {
    _pokemonDatabaseImpl.savePokemon(pokemon: pokemon);
    favorites.value.add(pokemon.id);
  }

  Future<void> deletePokemon({required Pokemon pokemon}) async {
    _pokemonDatabaseImpl.removePokemon(pokemon: pokemon);
    favorites.value.removeWhere((element) => element == pokemon.id);
    loadFavoritesPokemon();
  }

  Future<void> loadFavoritesPokemon() async {
    var pokemonList = await _pokemonDatabaseImpl.getFavoritesPokemon();
    change(
      pokemonList,
      status: pokemonList.isEmpty ? RxStatus.empty() : RxStatus.success(),
    );
  }

  Future<void> getFavoritesFromList(
      {required List<Pokemon> pokemonList}) async {
    favorites.value.clear();
    for (var pokemon in pokemonList) {
      var existPokemon =
          await _pokemonDatabaseImpl.existPokemonSaved(id: pokemon.id);
      if (existPokemon) {
        favorites.value.add(pokemon.id);
      }
    }
  }
}
