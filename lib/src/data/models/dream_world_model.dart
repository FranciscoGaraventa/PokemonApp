import '../../domain/entities/dream_world.dart';

class DreamWordModel extends DreamWorld {
  DreamWordModel({
    String? frontDefault,
    String? frontFemale,
  }) : super(
          frontDefault: frontDefault,
          frontFemale: frontFemale,
        );

  factory DreamWordModel.fromJson(Map<String, dynamic> json) => DreamWordModel(
        frontDefault: json['frontDefault'],
        frontFemale: json['frontFemale'],
      );
}
