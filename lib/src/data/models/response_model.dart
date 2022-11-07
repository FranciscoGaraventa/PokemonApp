import '../../domain/entities/pokemon_response.dart';
import 'property_model.dart';

class ResponseModel extends PokemonResponse {
  ResponseModel({
    required int count,
    String? next,
    String? previous,
    required List<PropertyModel> results,
  }) : super(
          count: count,
          next: next,
          previous: previous,
          results: results,
        );

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        count: json['count'],
        next: json['next'],
        previous: json['previous'],
        results: List<PropertyModel>.from(
          (json['results'] as List<dynamic>).map((result) =>
              PropertyModel.fromJson(result as Map<String, dynamic>)),
        ),
      );
}
