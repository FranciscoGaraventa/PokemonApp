import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/evolution_model.dart';
import '../../../core/utils/constants.dart';
import '../../models/pokemon_model.dart';
import '../../models/response_model.dart';
import '../../models/species_model.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/${Constants.pokemonCollection}/?limit={limit}&offset={offset}')
  Future<HttpResponse<ResponseModel>> getPokemons(
    @Path('limit') int limit,
    @Path('offset') int offset,
  );

  @GET('/${Constants.pokemonCollection}/{id}/')
  Future<HttpResponse<PokemonModel>> getPokemonById(
    @Path('id') int id,
  );

  @GET('/${Constants.evolutionChain}/{id}/')
  Future<HttpResponse<EvolutionModel>> getPokemonEvolution(
    @Path('id') int id,
  );

  @GET('/${Constants.species}/{id}/')
  Future<HttpResponse<SpeciesModel>> getPokemonSpecies(
    @Path('id') int id,
  );
}
