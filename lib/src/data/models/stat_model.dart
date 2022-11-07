import 'property_model.dart';
import '../../domain/entities/stat.dart';

class StatModel extends Stat {
  StatModel({
    required int baseStat,
    required int effort,
    required PropertyModel stat,
  }) : super(
          baseStat: baseStat,
          effort: effort,
          stat: stat,
        );

  factory StatModel.fromJson(Map<String, dynamic> json) => StatModel(
        baseStat: json['base_stat'],
        effort: json['effort'],
        stat: PropertyModel.fromJson(json['stat'] as Map<String, dynamic>),
      );
}
