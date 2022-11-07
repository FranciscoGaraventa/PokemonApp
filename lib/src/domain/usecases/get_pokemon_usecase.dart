import '../../data/models/response_model.dart';
import '../repositories/i_pokemon_repository.dart';
import '../../core/usecases/usecase.dart';
import '../../core/resources/data_state.dart';

class GetPokemonUseCase
    implements UseCase<DataState<ResponseModel>, Map<String, int>> {
  GetPokemonUseCase(this._pokemonRepository);

  final IPokemonRepository _pokemonRepository;

  @override
  Future<DataState<ResponseModel>> call({Map<String, int>? params}) {
    return _pokemonRepository.getPokemons(
      limit: params!['limit']!,
      offset: params['offset']!,
    );
  }
}
