import '../../data/models/evolution_model.dart';
import '../../core/resources/data_state.dart';
import '../../core/usecases/usecase.dart';
import '../repositories/i_pokemon_repository.dart';

class GetPokemonEvolutionCase implements UseCase<DataState<EvolutionModel>, int> {
  GetPokemonEvolutionCase(this._pokemonRepository);

  final IPokemonRepository _pokemonRepository;

  @override
  Future<DataState<EvolutionModel>> call({int? params}) {
    return _pokemonRepository.getPokemonEvolutions(id: params!);
  }
}
