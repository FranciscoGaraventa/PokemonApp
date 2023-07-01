import '../../domain/entities/species_response.dart';
import 'property_model.dart';

class SpeciesModel extends SpeciesResponse {
  SpeciesModel({
    required super.baseHappiness,
    required super.captureRate,
    required super.evolutionChain,
    required super.formsSwitchable,
    required super.genderRate,
    required super.generations,
    required super.growthRate,
    required super.habitat,
    required super.hasGenderDifferences,
    required super.hatchCounter,
    required super.id,
    required super.isBaby,
    required super.isLegendary,
    required super.isMythical,
    required super.name,
    required super.order,
    required super.shape,
  });

  factory SpeciesModel.fromJson(Map<String, dynamic> json) => SpeciesModel(
      baseHappiness: json['base_happiness'],
      captureRate: json['capture_rate'],
      evolutionChain: json['evolution_chain']['url'],
      formsSwitchable: json['forms_switchable'],
      genderRate: json['gender_rate'],
      generations: PropertyModel.fromJson(json['generation']),
      growthRate: PropertyModel.fromJson(json['growth_rate']),
      habitat: PropertyModel.fromJson(json['habitat']),
      hasGenderDifferences: json['has_gender_differences'],
      hatchCounter: json['hatch_counter'],
      id: json['id'],
      isBaby: json['is_baby'],
      isLegendary: json['is_legendary'],
      isMythical: json['is_mythical'],
      name: json['name'],
      order: json['order'],
      shape: PropertyModel.fromJson(json['shape']),
  );
}
