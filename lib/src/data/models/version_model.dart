import '../../domain/entities/property.dart';

class VersionModel extends Property {
  VersionModel({
    required String name,
    required String url,
  }) : super(
          name: name,
          url: url,
        );

  factory VersionModel.fromJson(Map<String, dynamic> json) => VersionModel(
        name: json['name'],
        url: json['url'],
      );
}
