import 'package:json_class/json_class.dart';

import 'version_group_detail.dart';
import 'property.dart';

class Moves extends JsonClass {
  Moves({
    required this.move,
    required this.versionGroupDetails,
  });

  final Property move;
  final List<VersionGroupDetail> versionGroupDetails;

  @override
  Map<String, dynamic> toJson() => {
        'move': move.toJson(),
        'version_group_details':
            versionGroupDetails.map((versionGroup) => versionGroup.toJson()).toList(),
      };
}
