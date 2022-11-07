import '../../domain/entities/pokemon.dart';
import 'stat_model.dart';
import 'type_model.dart';
import 'sprites_model.dart';
import 'abilities_model.dart';
import 'moves_model.dart';
import 'property_model.dart';
import 'game_indices_model.dart';

class PokemonModel extends Pokemon {
  PokemonModel({
    required int id,
    required List<AbilitiesModel> abilities,
    required int baseExperience,
    required List<PropertyModel> forms,
    required List<GameIndicesModel> gameIndices,
    required int height,
    required bool isDefault,
    required String locationAreaEncounters,
    required List<MovesModel> moves,
    required String name,
    required int order,
    required PropertyModel species,
    required SpritesModel sprites,
    required List<StatModel> stats,
    required List<TypeModel> types,
    required int weight,
  }) : super(
          id: id,
          abilities: abilities,
          baseExperience: baseExperience,
          forms: forms,
          gameIndices: gameIndices,
          height: height,
          isDefault: isDefault,
          locationAreaEncounters: locationAreaEncounters,
          moves: moves,
          name: name,
          order: order,
          species: species,
          sprites: sprites,
          stats: stats,
          types: types,
          weight: weight,
        );

  factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
        id: json['id'],
        abilities: List<AbilitiesModel>.from(
          (json['abilities'] as List<dynamic>).map((ability) =>
              AbilitiesModel.fromJson(ability as Map<String, dynamic>)),
        ),
        baseExperience: json['base_experience'],
        forms: List<PropertyModel>.from(
          (json['forms'] as List<dynamic>).map((form) =>
              PropertyModel.fromJson(form as Map<String, dynamic>)),
        ),
        gameIndices: List<GameIndicesModel>.from(
          (json['game_indices'] as List<dynamic>).map((gameIndice) =>
              GameIndicesModel.fromJson(gameIndice as Map<String, dynamic>)),
        ),
        height: json['height'],
        isDefault: json['is_default'],
        locationAreaEncounters: json['location_area_encounters'],
        moves: List<MovesModel>.from(
          (json['moves'] as List<dynamic>)
              .map((move) => MovesModel.fromJson(move as Map<String, dynamic>)),
        ),
        name: json['name'],
        order: json['order'],
        species: PropertyModel.fromJson(json['species']),
        sprites: SpritesModel.fromJson(json['sprites']),
        stats: List<StatModel>.from(
          (json['stats'] as List<dynamic>)
              .map((stat) => StatModel.fromJson(stat as Map<String, dynamic>)),
        ),
        types: List<TypeModel>.from(
          (json['types'] as List<dynamic>)
              .map((type) => TypeModel.fromJson(type as Map<String, dynamic>)),
        ),
        weight: json['weight'],
      );
}
