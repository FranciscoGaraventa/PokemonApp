import 'dart:convert';

import 'package:floor/floor.dart';
import '../../../../domain/entities/moves.dart';
import '../../../models/moves_model.dart';

class MovesConverter extends TypeConverter<List<Moves>, String> {
  @override
  List<Moves> decode(String databaseValue) {
    var json = jsonDecode(databaseValue) as List<dynamic>;
    return List<Moves>.from(
      json.map((moves) => MovesModel.fromJson(moves))
    );
  }

  @override
  String encode(List<Moves> value) {
    return jsonEncode(value.map((move) => move.toJson()).toList());
  }
}
