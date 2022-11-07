import 'property.dart';

class Abilities {
  Abilities({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });

  final Property ability;
  final bool isHidden;
  final int slot;
}
