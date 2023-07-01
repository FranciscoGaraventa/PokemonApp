import '../../core/resources/data_state.dart';
import '../../core/usecases/usecase.dart';
import '../../data/models/species_model.dart';
import '../repositories/i_pokemon_repository.dart';

class GetPokemonSpeciesUseCase implements UseCase<DataState<SpeciesModel>, int> {
  GetPokemonSpeciesUseCase(this._pokemonRepository);

  final IPokemonRepository _pokemonRepository;

  @override
  Future<DataState<SpeciesModel>> call({int? params}) {
    return _pokemonRepository.getPokemonSpecie(id: params!);
  }
}
