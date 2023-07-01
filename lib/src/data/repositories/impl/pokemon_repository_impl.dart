import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pokemon_app/src/data/models/evolution_model.dart';
import 'package:pokemon_app/src/data/models/species_model.dart';

import '../../datasources/remote/rest_client.dart';
import '../../../core/resources/data_state.dart';
import '../../../domain/repositories/i_pokemon_repository.dart';
import '../../models/pokemon_model.dart';
import '../../models/response_model.dart';

class PokemonRepositoryImpl implements IPokemonRepository {
  const PokemonRepositoryImpl(this._restClient);

  final RestClient _restClient;

  @override
  Future<DataState<ResponseModel>> getPokemons({
    required int limit,
    required int offset,
  }) async {
    try {
      final response = await _restClient.getPokemons(
        limit,
        offset,
      );
      if (response.response.statusCode == HttpStatus.ok) {
        return DataSuccess(ResponseModel.fromJson(response.response.data));
      }
      return DataFailed(
        DioError(
          error: response.response.statusMessage,
          response: response.response,
          type: DioErrorType.response,
          requestOptions: response.response.requestOptions,
        ),
      );
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<PokemonModel>> getPokemonById({required int id}) async {
    try {
      final response = await _restClient.getPokemonById(id);
      if (response.response.statusCode == HttpStatus.ok) {
        return DataSuccess(response.data);
      }
      return DataFailed(
        DioError(
          error: response.response.statusMessage,
          response: response.response,
          type: DioErrorType.response,
          requestOptions: response.response.requestOptions,
        ),
      );
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<EvolutionModel>> getPokemonEvolutions({required int id}) async {
    try {
      final response = await _restClient.getPokemonEvolution(id);
      if (response.response.statusCode == HttpStatus.ok) {
        return DataSuccess(response.data);
      }
      return DataFailed(
        DioError(
          error: response.response.statusMessage,
          response: response.response,
          type: DioErrorType.response,
          requestOptions: response.response.requestOptions,
        ),
      );
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<SpeciesModel>> getPokemonSpecie({required int id}) async {
    try {
      final response = await _restClient.getPokemonSpecies(id);
      if (response.response.statusCode == HttpStatus.ok) {
        return DataSuccess(response.data);
      }
      return DataFailed(
        DioError(
          error: response.response.statusMessage,
          response: response.response,
          type: DioErrorType.response,
          requestOptions: response.response.requestOptions,
        ),
      );
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }
}
