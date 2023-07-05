import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'resources/env.dart';

import '../data/datasources/local/pokemon_database.dart';
import '../data/repositories/impl/pokemon_database_impl.dart';
import '../presentation/blocs/pokemon_database_controller.dart';
import '../domain/usecases/get_pokemon_species_usecase.dart';
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

  final db =
      await $FloorPokemonDatabase.databaseBuilder(Env.databaseName).build();
  Get.put(
    db,
    permanent: true,
  );

  Get.put(
    GlobalKey<NavigatorState>(),
    permanent: true,
  );

  Get.lazyPut(
    () => PokemonDatabaseController(
      PokemonDatabaseImpl(db),
    ),
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
