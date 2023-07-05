import 'package:json_class/json_class.dart';

class OfficialArtwork extends JsonClass {
  OfficialArtwork({
    required this.frontDefault,
    required this.frontShiny,
  });

  final String frontDefault;
  final String frontShiny;

  @override
  Map<String, dynamic> toJson() => {
        'front_default': frontDefault,
        'front_shiny': frontShiny,
      };
}
