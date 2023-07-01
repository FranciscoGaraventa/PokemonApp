import 'property_model.dart';
import '../../domain/entities/chain.dart';

class ChainModel extends Chain {
  ChainModel({
    required List<ChainModel> evolution,
    required bool isBaby,
    required PropertyModel species,
  }) : super(
          evolution: evolution,
          isBaby: isBaby,
          species: species,
        );

  factory ChainModel.fromJson(Map<String, dynamic> json) {
    return ChainModel(
      evolution: List<ChainModel>.from(
        (json['evolves_to'] as List<dynamic>).map(
            (evolves) => ChainModel.fromJson(evolves as Map<String, dynamic>)),
      ),
      isBaby: json['is_baby'],
      species: PropertyModel.fromJson(json['species']),
    );
  }
}
