import '../../domain/entities/abilities.dart';
import 'property_model.dart';

class AbilitiesModel extends Abilities {
  AbilitiesModel({
    required PropertyModel ability,
    required bool isHidden,
    required int slot,
  }) : super(
          ability: ability,
          isHidden: isHidden,
          slot: slot,
        );

  factory AbilitiesModel.fromJson(Map<String, dynamic> json) => AbilitiesModel(
        ability: PropertyModel.fromJson(json['ability']),
        isHidden: json['is_hidden'],
        slot: json['slot'],
      );
}
