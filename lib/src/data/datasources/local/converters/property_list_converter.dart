import 'dart:convert';

import 'package:floor/floor.dart';
import '../../../../domain/entities/property.dart';
import '../../../models/property_model.dart';

class PropertyListConverter extends TypeConverter<List<Property>, String> {
  @override
  List<Property> decode(String databaseValue) {
    var json = jsonDecode(databaseValue) as List<dynamic>;
    return List<Property>.from(
        json.map((property) => PropertyModel.fromJson(property)));
  }

  @override
  String encode(List<Property> value) {
    return jsonEncode(value.map((property) => property.toJson()).toList());
  }
}
