import 'package:pokemon_app/src/data/models/property_model.dart';

import '../../domain/entities/version_group_detail.dart';

class VersionGroupDetailModel extends VersionGroupDetail {
  VersionGroupDetailModel({
    required int levelLearnedAt,
    required PropertyModel moveLearnMethod,
    required PropertyModel versionGroup,
  }) : super(
          levelLearnedAt: levelLearnedAt,
          moveLearnMethod: moveLearnMethod,
          versionGroup: versionGroup,
        );

  factory VersionGroupDetailModel.fromJson(Map<String, dynamic> json) =>
      VersionGroupDetailModel(
        levelLearnedAt: json['level_learned_at'],
        moveLearnMethod: PropertyModel.fromJson(json['move_learn_method']),
        versionGroup: PropertyModel.fromJson(json['version_group']),
      );
}
