import 'dart:convert';

import 'package:floor/floor.dart';

import '../../../../domain/entities/stat.dart';
import '../../../models/stat_model.dart';

class StatConverter extends TypeConverter<List<Stat>, String> {
  @override
  List<Stat> decode(String databaseValue) {
    var json = jsonDecode(databaseValue) as List<dynamic>;
    return List<Stat>.from(
      json.map((stat) => StatModel.fromJson(stat))
    );
  }

  @override
  String encode(List<Stat> value) {
    return jsonEncode(value.map((stat) => stat.toJson()).toList());
  }
}
