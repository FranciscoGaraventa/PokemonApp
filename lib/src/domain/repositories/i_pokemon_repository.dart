import '../../core/resources/data_state.dart';
import '../../data/models/evolution_model.dart';
import '../../data/models/pokemon_model.dart';
import '../../data/models/response_model.dart';
import '../../data/models/species_model.dart';

abstract class IPokemonRepository {
  Future<DataState<ResponseModel>> getPokemons({
    required int limit,
    required int offset,
  });

  Future<DataState<PokemonModel>> getPokemonById({required int id});

  Future<DataState<EvolutionModel>> getPokemonEvolutions({required int id});

  Future<DataState<SpeciesModel>> getPokemonSpecie({required int id});
}
