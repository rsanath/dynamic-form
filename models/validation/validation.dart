import 'validation_type.dart';

part 'validation.g.dart';

class Validation {
  ValidationType type;
  String value;

  Validation({
    this.type,
    this.value,
  });

  factory Validation.fromJson(Map<String, dynamic> json) =>
      _$ValidationFromJson(json);

  Map<String, dynamic> toJson() => _$ValidationToJson(this);
}
