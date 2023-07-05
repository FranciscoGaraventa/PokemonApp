import 'dart:convert';

import 'package:floor/floor.dart';
import '../../../../domain/entities/type.dart';
import '../../../models/type_model.dart';

class TypesConverter extends TypeConverter<List<Type>, String> {
  @override
  List<Type> decode(String databaseValue) {
    var json = jsonDecode(databaseValue) as List<dynamic>;
    return List<Type>.from(
      json.map((type) => TypeModel.fromJson(type))
    );
  }

  @override
  String encode(List<Type> value) {
    return jsonEncode(value.map((type) => type.toJson()).toList());
  }
}
