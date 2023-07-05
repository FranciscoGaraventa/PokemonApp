import 'package:json_class/json_class.dart';

import 'property.dart';

class GameIndices extends JsonClass {
  GameIndices({
    required this.gameIndex,
    required this.version,
  });

  final int gameIndex;
  final Property version;

  @override
  Map<String, dynamic> toJson() => {
        'game_index': gameIndex,
        'version': version.toJson(),
      };
}
