import 'package:pokemon_app/src/domain/entities/other_sprites.dart';

import '../../domain/entities/sprites.dart';
import 'other_model.dart';

class SpritesModel extends Sprites {
  SpritesModel({
    String? backDefault,
    String? backFemale,
    String? backShiny,
    String? backShinyFemale,
    String? frontDefault,
    String? frontFemale,
    String? frontShiny,
    String? frontShinyFemale,
    OtherSprites? other,
  }) : super(
          backDefault: backDefault,
          backFemale: backFemale,
          backShiny: backShiny,
          backShinyFemale: backShinyFemale,
          frontDefault: frontDefault,
          frontFemale: frontFemale,
          frontShiny: frontShiny,
          frontShinyFemale: frontShinyFemale,
          other: other,
        );

  factory SpritesModel.fromJson(Map<String, dynamic> json) => SpritesModel(
        backDefault: json['back_default'],
        backFemale: json['back_female'],
        backShiny: json['back_shiny'],
        backShinyFemale: json['back_shiny_female'],
        frontDefault: json['front_default'],
        frontFemale: json['front_female'],
        frontShiny: json['front_shiny'],
        frontShinyFemale: json['front_shiny_female'],
        other: OtherModel.fromJson(json['other'] as Map<String, dynamic>),
      );
}
