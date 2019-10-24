import 'condition_type.dart';

part 'condition.g.dart';

class Condition {
  ConditionType type;
  String value;

  Condition({
    this.type,
    this.value,
  });

  factory Condition.fromJson(Map<String, dynamic> json) => _$ConditionFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionToJson(this);
}
