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

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Validation &&
              runtimeType == other.runtimeType &&
              type == other.type &&
              value == other.value;

  @override
  int get hashCode =>
      type.hashCode ^
      value.hashCode;



}
