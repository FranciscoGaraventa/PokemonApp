import 'package:get/get.dart';

import '../../core/utils/constants.dart';
import '../../domain/usecases/get_pokemon_species_usecase.dart';
import '../../domain/entities/chain.dart';
import '../../domain/entities/property.dart';
import '../../domain/usecases/get_pokemon_by_id_usecase.dart';
import '../../core/resources/data_state.dart';
import '../../domain/entities/pokemon.dart';
import '../../domain/usecases/get_pokemon_evolutions_usecase.dart';

class PokemonEvolutionController extends GetxController
    with StateMixin<List<Pokemon>> {
  PokemonEvolutionController(
    this._getPokemonByIdUseCase,
    this._getPokemonSpeciesUseCase,
    this._getPokemonEvolutionCase,
  );

  final GetPokemonByIdUseCase _getPokemonByIdUseCase;
  final GetPokemonSpeciesUseCase _getPokemonSpeciesUseCase;
  final GetPokemonEvolutionCase _getPokemonEvolutionCase;

  void _getEvolutions(
      {required Chain chain, required List<Property> property}) {
    if (chain.evolution.isNotEmpty) {
      _getEvolutions(chain: chain.evolution.first, property: property);
    }
    property.add(chain.species);
  }

  Future<Pokemon?> _getPokemonFromProperty({
    required Property property,
  }) async {
    var url = property.url.replaceAll(
      '${Constants.baseUrl}${Constants.species}/',
      Constants.emptyString,
    );
    var response = await _getPokemonByIdUseCase.call(
      params: int.parse(
        url.substring(
          0,
          url.length - 1,
        ),
      ),
    );
    return response.data;
  }

  void getPokemonEvolutions({required int id}) async {
    change(
      null,
      status: RxStatus.loading(),
    );
    var dataSpeciesState = await _getPokemonSpeciesUseCase.call(params: id);
    if (dataSpeciesState is DataSuccess) {
      var dataState = await _getPokemonEvolutionCase.call(
          params: dataSpeciesState.data!.getEvolutionChain());
      if (dataState is DataSuccess) {
        var propertyList = <Property>[];
        _getEvolutions(chain: dataState.data!.chain, property: propertyList);
        var evolutionList = <Pokemon>[];
        for (var property in propertyList) {
          var pokemon = await _getPokemonFromProperty(property: property);
          evolutionList.addIf(pokemon != null, pokemon!);
        }
        evolutionList.removeWhere((pokemon) => pokemon.id == id || pokemon.id < id);
        change(
          evolutionList,
          status:
              evolutionList.isNotEmpty ? RxStatus.success() : RxStatus.empty(),
        );
      } else {
        change(
          null,
          status: RxStatus.error(dataState.error!.message),
        );
      }
    } else {
      change(
        null,
        status: RxStatus.error(dataSpeciesState.error!.message),
      );
    }
  }
}
