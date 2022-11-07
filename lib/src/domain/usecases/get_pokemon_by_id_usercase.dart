import '../../core/resources/data_state.dart';
import '../../core/usecases/usecase.dart';
import '../entities/pokemon.dart';
import '../repositories/i_pokemon_repository.dart';

class GetPokemonByIdUseCase implements UseCase<DataState<Pokemon>, int> {
  GetPokemonByIdUseCase(this._pokemonRepository);

  final IPokemonRepository _pokemonRepository;

  @override
  Future<DataState<Pokemon>> call({int? params}) {
    return _pokemonRepository.getPokemonById(id: params!);
  }
}
