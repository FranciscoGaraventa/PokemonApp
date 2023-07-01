import '../../core/utils/constants.dart';
import 'property.dart';

class SpeciesResponse {
  SpeciesResponse({
    required this.baseHappiness,
    required this.captureRate,
    required this.evolutionChain,
    required this.formsSwitchable,
    required this.genderRate,
    required this.generations,
    required this.growthRate,
    required this.habitat,
    required this.hasGenderDifferences,
    required this.hatchCounter,
    required this.id,
    required this.isBaby,
    required this.isLegendary,
    required this.isMythical,
    required this.name,
    required this.order,
    required this.shape,
  });

  final int baseHappiness;
  final int captureRate;
  final String evolutionChain;
  final bool formsSwitchable;
  final int genderRate;
  final Property generations;
  final Property growthRate;
  final Property habitat;
  final bool hasGenderDifferences;
  final int hatchCounter;
  final int id;
  final bool isBaby;
  final bool isLegendary;
  final bool isMythical;
  final String name;
  final int order;
  final Property shape;

  int getEvolutionChain() {
    var evolutionString = evolutionChain.substring(0, evolutionChain.length - 1);
    return int.parse(evolutionString.replaceAll('${Constants.baseUrl}${Constants.evolutionChain}/', ''));
  }
}
