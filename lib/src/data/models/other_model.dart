import '../../domain/entities/other_sprites.dart';
import 'dream_world_model.dart';
import 'home_model.dart';
import 'official_artwork_model.dart';

class OtherModel extends OtherSprites {
  OtherModel({
    required DreamWordModel dreamWorld,
    required HomeModel home,
    required OfficialArtworkModel officialArtwork,
  }) : super(
          dreamWorld: dreamWorld,
          home: home,
          officialArtwork: officialArtwork,
        );

  factory OtherModel.fromJson(Map<String, dynamic> json) => OtherModel(
        dreamWorld: DreamWordModel.fromJson(json['dream_world']),
        home: HomeModel.fromJson(json['home']),
        officialArtwork:
            OfficialArtworkModel.fromJson(json['official-artwork']),
      );
}
