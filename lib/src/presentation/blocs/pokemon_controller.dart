import 'package:get/get.dart';

import 'pokemon_database_controller.dart';
import '../../core/model/rx_nullable.dart';
import '../../domain/entities/property.dart';
import '../../core/utils/constants.dart';
import '../../domain/usecases/get_pokemon_by_id_usecase.dart';
import '../../core/resources/data_state.dart';
import '../../domain/entities/pokemon.dart';
import '../../domain/usecases/get_pokemon_usecase.dart';

class PokemonController extends GetxController with StateMixin<List<Pokemon>> {
  PokemonController(
    this._getPokemonUseCase,
    this._getPokemonByIdUseCase,
  );

  final GetPokemonUseCase _getPokemonUseCase;
  final GetPokemonByIdUseCase _getPokemonByIdUseCase;
  RxInt limit = 0.obs;
  RxInt offset = 0.obs;
  Rx<String?> previousPageUrl = RxNullable<String?>().setNull();
  Rx<String?> nextPageUrl = RxNullable<String?>().setNull();
  RxInt currentPokemonSelected = 0.obs;
  RxBool isPokemonSaved = false.obs;

  void setPokemonDetailSelection({required int id, required bool isSaved}) {
    currentPokemonSelected.value = id;
    isPokemonSaved.value = isSaved;
  }

  Future<List<Pokemon>> getPokemonsFromState({
    required DataState state,
    required PageType pageType,
  }) async {
    var pokemons = <Pokemon>[];

    for (var element in state.data!.results) {
      var url = (element as Property).url.replaceAll(
            '${Constants.baseUrl}${Constants.pokemonCollection}/',
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
      pokemons.add(response.data!);
    }
    return pokemons;
  }

  void _extractLimitOffset({required String url}) {
    var subStringList = url.split('&');
    offset.value = int.parse(
      subStringList.first.replaceAll(
        'offset=',
        Constants.emptyString,
      ),
    );
    limit.value = int.parse(
      subStringList.last.replaceAll(
        'limit=',
        Constants.emptyString,
      ),
    );
  }

  void getPokemons({required PageType pageType}) async {
    change(
      null,
      status: RxStatus.loading(),
    );
    switch (pageType) {
      case PageType.initialPage:
        break;
      case PageType.nextPage:
        var url = nextPageUrl.value!.replaceAll(
          '${Constants.baseUrl}${Constants.pokemonCollection}/?',
          Constants.emptyString,
        );
        _extractLimitOffset(url: url);
        break;
      case PageType.previousPage:
        var url = previousPageUrl.value!.replaceAll(
          '${Constants.baseUrl}${Constants.pokemonCollection}/?',
          Constants.emptyString,
        );
        _extractLimitOffset(url: url);
        break;
    }

    var dataState = await _getPokemonUseCase.call(
      params: <String, int>{
        'limit': limit.value,
        'offset': offset.value,
      },
    );
    if (dataState is DataSuccess) {
      previousPageUrl.value = dataState.data!.previous;
      nextPageUrl.value = dataState.data!.next;
      await getPokemonsFromState(
        state: dataState,
        pageType: pageType,
      ).then(
        (pokemonList) async {
          await Get.find<PokemonDatabaseController>()
              .getFavoritesFromList(pokemonList: pokemonList);
          change(
            pokemonList,
            status:
                pokemonList.isNotEmpty ? RxStatus.success() : RxStatus.empty(),
          );
        },
      );
    } else {
      change(
        null,
        status: RxStatus.error(dataState.error!.message),
      );
    }
  }
}

enum PageType {
  initialPage,
  nextPage,
  previousPage,
}
