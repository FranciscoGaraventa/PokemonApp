import '../../domain/entities/home.dart';

class HomeModel extends Home {
  HomeModel({
    required String frontDefault,
    String? frontFemale,
    required String frontShiny,
    String? frontShinyFemale,
  }) : super(
          frontDefault: frontDefault,
          frontFemale: frontFemale,
          frontShiny: frontShiny,
          frontShinyFemale: frontShinyFemale,
        );

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
      frontDefault: json['front_default'],
      frontFemale: json['front_female'],
      frontShiny: json['front_shiny'],
      frontShinyFemale: json['front_shiny_female']);
}
