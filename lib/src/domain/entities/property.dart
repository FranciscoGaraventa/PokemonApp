import 'package:json_class/json_class.dart';

class Property extends JsonClass {
  Property({
    required this.name,
    required this.url,
  });

  final String name;
  final String url;

  @override
  Map<String, dynamic> toJson() => {
        'name': name,
        'url': url,
      };
}
