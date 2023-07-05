import 'package:json_class/json_class.dart';

import 'property.dart';

class Abilities extends JsonClass {
  Abilities({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });

  final Property ability;
  final bool isHidden;
  final int slot;

  @override
  Map<String, dynamic> toJson() => {
        'ability': ability.toJson(),
        'is_hidden': isHidden,
        'slot': slot,
      };
}
