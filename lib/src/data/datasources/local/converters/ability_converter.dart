import 'dart:convert';

import 'package:floor/floor.dart';

import '../../../../domain/entities/abilities.dart';
import '../../../models/abilities_model.dart';

class AbilityConverter extends TypeConverter<List<Abilities>, String> {
  @override
  List<Abilities> decode(String databaseValue) {
    var json = jsonDecode(databaseValue) as List<dynamic>;
    return List<Abilities>.from(
      json.map((ability) => AbilitiesModel.fromJson(ability))
    );
  }

  @override
  String encode(List<Abilities> value) {
    return jsonEncode(value.map((ability) => ability.toJson()).toList());
  }
}
