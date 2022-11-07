import '../../domain/entities/property.dart';

class PropertyModel extends Property {
  PropertyModel({
    required String name,
    required String url,
  }) : super(
          name: name,
          url: url,
        );

  factory PropertyModel.fromJson(Map<String, dynamic> json) => PropertyModel(
        name: json['name'],
        url: json['url'],
      );
}
