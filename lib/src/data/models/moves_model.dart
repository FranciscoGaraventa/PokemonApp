import 'version_group_detail_model.dart';
import 'property_model.dart';
import '../../domain/entities/moves.dart';

class MovesModel extends Moves {
  MovesModel({
    required PropertyModel move,
    required List<VersionGroupDetailModel> versionGroupDetail,
  }) : super(
          move: move,
          versionGroupDetails: versionGroupDetail,
        );

  factory MovesModel.fromJson(Map<String, dynamic> json) => MovesModel(
        move: PropertyModel.fromJson(json['move']),
        versionGroupDetail: List<VersionGroupDetailModel>.from(
          (json['version_group_details'] as List<dynamic>).map(
            (versionGroupDetail) => VersionGroupDetailModel.fromJson(
                versionGroupDetail as Map<String, dynamic>),
          ),
        ),
      );
}
