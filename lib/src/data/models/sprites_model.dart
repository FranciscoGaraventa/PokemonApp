import '../../domain/entities/sprites.dart';

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
  }) : super(
          backDefault: backDefault,
          backFemale: backFemale,
          backShiny: backShiny,
          backShinyFemale: backShinyFemale,
          frontDefault: frontDefault,
          frontFemale: frontFemale,
          frontShiny: frontShiny,
          frontShinyFemale: frontShinyFemale,
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
      );
}
