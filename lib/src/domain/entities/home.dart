import 'package:json_class/json_class.dart';

class Home extends JsonClass {
  Home({
    required this.frontDefault,
    this.frontFemale,
    required this.frontShiny,
    this.frontShinyFemale,
  });

  final String frontDefault;
  final String? frontFemale;
  final String frontShiny;
  final String? frontShinyFemale;

  @override
  Map<String, dynamic> toJson() => {
        'front_default': frontDefault,
        'front_female': frontFemale,
        'front_shiny': frontShiny,
        'front_shiny_female': frontShinyFemale,
      };
}
