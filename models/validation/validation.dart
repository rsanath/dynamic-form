import 'validation_type.dart';

part 'validation.g.dart';

class Validation {
  ValidationType type;
  String value;

  Validation({
    this.type,
    this.value,
  });

  bool validate(String givenValue) {
    switch (type) {
      case ValidationType.CONTAINS:
        return givenValue?.contains(value) ?? false;
      case ValidationType.IS:
        return givenValue == value;
      case ValidationType.IS_EMPTY:
        return givenValue?.isEmpty ?? true;
      case ValidationType.IS_NOT_EMPTY:
        return givenValue?.isNotEmpty ?? false;
    }
    return false;
  }

  factory Validation.fromJson(Map<String, dynamic> json) =>
      _$ValidationFromJson(json);

  Map<String, dynamic> toJson() => _$ValidationToJson(this);
}
