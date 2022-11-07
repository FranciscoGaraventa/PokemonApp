import 'property_model.dart';
import '../../domain/entities/type.dart';

class TypeModel extends Type {
  TypeModel({
    required int slot,
    required PropertyModel type,
  }) : super(slot: slot, type: type);

  factory TypeModel.fromJson(Map<String, dynamic> json) => TypeModel(
        slot: json['slot'],
        type: PropertyModel.fromJson(json['type']),
      );
}
