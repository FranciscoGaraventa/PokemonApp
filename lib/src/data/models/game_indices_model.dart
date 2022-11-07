import 'version_model.dart';
import '../../domain/entities/game_indices.dart';

class GameIndicesModel extends GameIndices {
  GameIndicesModel({
    required int gameIndex,
    required VersionModel version,
  }) : super(
          gameIndex: gameIndex,
          version: version,
        );

  factory GameIndicesModel.fromJson(Map<String, dynamic> json) =>
      GameIndicesModel(
        gameIndex: json['game_index'],
        version: VersionModel.fromJson(json['version'] as Map<String, dynamic>),
      );
}
