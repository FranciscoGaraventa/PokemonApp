import 'dart:convert';

import 'package:floor/floor.dart';
import '../../../../domain/entities/game_indices.dart';
import '../../../models/game_indices_model.dart';

class GameIndicesConverter extends TypeConverter<List<GameIndices>, String> {
  @override
  List<GameIndices> decode(String databaseValue) {
    var json = jsonDecode(databaseValue) as List<dynamic>;
    return List<GameIndices>.from(
        json.map((gameIndices) => GameIndicesModel.fromJson(gameIndices))
    );
  }

  @override
  String encode(List<GameIndices> value) {
    return jsonEncode(
        value.map((gameIndices) => gameIndices.toJson()).toList());
  }
}
