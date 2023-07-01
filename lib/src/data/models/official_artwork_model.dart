import '../../domain/entities/official_artwork.dart';

class OfficialArtworkModel extends OfficialArtwork {
  OfficialArtworkModel({
    required String frontDefault,
    required String frontShiny,
  }) : super(
          frontDefault: frontDefault,
          frontShiny: frontShiny,
        );

  factory OfficialArtworkModel.fromJson(Map<String, dynamic> json) =>
      OfficialArtworkModel(
        frontDefault: json['front_default'],
        frontShiny: json['front_shiny'],
      );
}
