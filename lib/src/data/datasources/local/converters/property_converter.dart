import 'dart:convert';

import 'package:floor/floor.dart';

import '../../../../domain/entities/property.dart';
import '../../../models/property_model.dart';

class PropertyConverter extends TypeConverter<Property, String> {
  @override
  Property decode(String databaseValue) {
    var json = jsonDecode(databaseValue) as Map<String, dynamic>;
    return PropertyModel.fromJson(json);
  }

  @override
  String encode(Property value) {
    return jsonEncode(value.toJson());
  }
}
