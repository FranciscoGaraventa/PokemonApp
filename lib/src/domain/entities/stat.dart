import 'package:json_class/json_class.dart';

import 'property.dart';

class Stat extends JsonClass {
  Stat({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  final int baseStat;
  final int effort;
  final Property stat;

  @override
  Map<String, dynamic> toJson() => {
        'base_stat': baseStat,
        'effort': effort,
        'stat': stat.toJson(),
      };
}
