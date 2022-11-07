import 'version_group_detail.dart';
import 'property.dart';

class Moves {
  Moves({
    required this.move,
    required this.versionGroupDetails,
});

  final Property move;
  final List<VersionGroupDetail> versionGroupDetails;
}
