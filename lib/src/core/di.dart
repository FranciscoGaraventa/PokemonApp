import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../domain/usecases/get_pokemon_by_id_usercase.dart';
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

  Get.lazyPut(
    () => PokemonController(
      GetPokemonUseCase(repository),
      GetPokemonByIdUseCase(repository),
    ),
  );
}
