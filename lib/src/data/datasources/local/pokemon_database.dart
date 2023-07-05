import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../../domain/entities/pokemon.dart';
import 'converters/property_converter.dart';
import 'converters/property_list_converter.dart';
import 'converters/sprites_converter.dart';
import 'converters/stat_converter.dart';
import 'converters/type_converter.dart';
import 'converters/ability_converter.dart';
import 'converters/game_indices_converter.dart';
import 'converters/moves_converter.dart';
import 'pokemon_dao.dart';

part 'pokemon_database.g.dart';

@TypeConverters([
  AbilityConverter,
  GameIndicesConverter,
  MovesConverter,
  PropertyConverter,
  PropertyListConverter,
  StatConverter,
  TypesConverter,
  SpritesConverter,
])
@Database(version: 1, entities: [Pokemon])
abstract class PokemonDatabase extends FloorDatabase {
  PokemonDao get pokemonDao;
}
