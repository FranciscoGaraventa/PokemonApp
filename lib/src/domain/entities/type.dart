import 'package:json_class/json_class.dart';

import 'property.dart';

class Type extends JsonClass {
  Type({
    required this.slot,
    required this.type,
  });

  final int slot;
  final Property type;

  @override
  Map<String, dynamic> toJson() => {
        'slot': slot,
        'type': type.toJson(),
      };
}
