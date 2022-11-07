import '../../core/resources/data_state.dart';
import '../../data/models/pokemon_model.dart';
import '../../data/models/response_model.dart';

abstract class IPokemonRepository {
  Future<DataState<ResponseModel>> getPokemons({
    required int limit,
    required int offset,
  });

  Future<DataState<PokemonModel>> getPokemonById({required int id});
}
