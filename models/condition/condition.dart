import 'condition_type.dart';

part 'condition.g.dart';

class Condition {
  ConditionType type;
  String value;

  Condition({
    this.type,
    this.value,
  });

  bool evaluate(String givenValue) {
    switch (type) {
      case ConditionType.IS:
        return givenValue == value;
      case ConditionType.IS_NOT:
        return givenValue != value;
      case ConditionType.CONTAINS:
        return givenValue?.contains(value) ?? false;
      case ConditionType.IS_EMPTY:
        return givenValue?.isEmpty ?? true;
      case ConditionType.IS_NOT_EMPTY:
        return givenValue?.isNotEmpty ?? false;
    }
    return false;
  }

  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionToJson(this);
}
