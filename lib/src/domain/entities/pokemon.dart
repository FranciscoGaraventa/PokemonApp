import 'stat.dart';
import 'sprites.dart';
import 'moves.dart';
import 'property.dart';
import 'abilities.dart';
import 'game_indices.dart';
import 'type.dart';

class Pokemon {
  Pokemon({
    required this.id,
    required this.abilities,
    required this.baseExperience,
    required this.forms,
    required this.gameIndices,
    required this.height,
    required this.isDefault,
    required this.locationAreaEncounters,
    required this.moves,
    required this.name,
    required this.order,
    required this.species,
    required this.sprites,
    required this.stats,
    required this.types,
    required this.weight,
  });

  final int id;
  final List<Abilities> abilities;
  final int baseExperience;
  final List<Property> forms;
  final List<GameIndices> gameIndices;
  final int height;
  final bool isDefault;
  final String locationAreaEncounters;
  final List<Moves> moves;
  final String name;
  final int order;
  final Property species;
  final Sprites sprites;
  final List<Stat> stats;
  final List<Type> types;
  final int weight;
}
