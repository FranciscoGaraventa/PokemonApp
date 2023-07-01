import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pokemon_app/src/domain/usecases/get_pokemon_species_usecase.dart';

import '../domain/usecases/get_pokemon_evolutions_usecase.dart';
import '../presentation/blocs/pokemon_evolution_controller.dart';
import '../domain/usecases/get_pokemon_by_id_usecase.dart';
import '../domain/usecases/get_pokemon_usecase.dart';
import '../data/datasources/remote/rest_client.dart';
import '../data/repositories/impl/pokemon_repository_impl.dart';
import '../presentation/blocs/pokemon_controller.dart';

Future<void> init() async {
  var repository = PokemonRepositoryImpl(
    RestClient(
      Dio(),
    ),
  );

  Get.put(
    GlobalKey<NavigatorState>(),
    permanent: true,
  );

  Get.lazyPut(
    () => PokemonController(
      GetPokemonUseCase(repository),
      GetPokemonByIdUseCase(repository),
    ),
  );

  Get.lazyPut(
    () => PokemonEvolutionController(
      GetPokemonByIdUseCase(repository),
      GetPokemonSpeciesUseCase(repository),
      GetPokemonEvolutionCase(repository),
    ),
  );
}
