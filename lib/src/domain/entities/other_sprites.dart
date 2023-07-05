import 'package:json_class/json_class.dart';

import 'official_artwork.dart';
import 'dream_world.dart';
import 'home.dart';

class OtherSprites extends JsonClass {
  OtherSprites({
    required this.dreamWorld,
    required this.home,
    required this.officialArtwork,
  });

  final DreamWorld dreamWorld;
  final Home home;
  final OfficialArtwork officialArtwork;

  @override
  Map<String, dynamic> toJson() => {
        'dream_world': dreamWorld.toJson(),
        'home': home.toJson(),
        'official-artwork': officialArtwork.toJson(),
      };
}
