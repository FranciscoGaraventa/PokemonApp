import 'package:json_class/json_class.dart';

import 'property.dart';

class VersionGroupDetail extends JsonClass {
  VersionGroupDetail({
    required this.levelLearnedAt,
    required this.moveLearnMethod,
    required this.versionGroup,
  });

  final int levelLearnedAt;
  final Property moveLearnMethod;
  final Property versionGroup;

  @override
  Map<String, dynamic> toJson() => {
        'level_learned_at': levelLearnedAt,
        'move_learn_method': moveLearnMethod.toJson(),
        'version_group': versionGroup.toJson(),
      };
}
