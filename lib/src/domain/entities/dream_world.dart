import 'package:json_class/json_class.dart';

class DreamWorld extends JsonClass {
  DreamWorld({
    this.frontDefault,
    this.frontFemale,
  });

  final String? frontDefault;
  final String? frontFemale;

  @override
  Map<String, dynamic> toJson() => {
        'frontDefault': frontDefault,
        'frontFemale': frontFemale,
      };
}
