import '../../domain/entities/evolution_response.dart';
import 'chain_model.dart';

class EvolutionModel extends EvolutionResponse {
  EvolutionModel({
    required int id,
    required ChainModel chain,
  }) : super(
          id: id,
          chain: chain,
        );

  factory EvolutionModel.fromJson(Map<String, dynamic> json) => EvolutionModel(
        id: json['id'],
        chain: ChainModel.fromJson(json['chain']),
      );
}

