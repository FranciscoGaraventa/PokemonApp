import 'dart:convert';

import 'package:floor/floor.dart';
import '../../../../domain/entities/sprites.dart';
import '../../../models/sprites_model.dart';

class SpritesConverter extends TypeConverter<Sprites, String> {
  @override
  Sprites decode(String databaseValue) {
    var json = jsonDecode(databaseValue) as Map<String, dynamic>;
    return SpritesModel.fromJson(json);
  }

  @override
  String encode(Sprites value) {
    return jsonEncode(value.toJson());
  }
}
