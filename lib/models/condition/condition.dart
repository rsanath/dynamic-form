import '../../util.dart';
import 'condition_type.dart';

part 'condition.g.dart';

class Condition {
  ConditionType type;
  String value;

  Condition({
    this.type,
    this.value,
  })  : assert(
          (type == ConditionType.GREATER_THAN ||
                  type == ConditionType.LESSER_THAN)
              ? parseInt(value) != null
              : true,
          "The test value for a condition should be numeric when using GREATER_THAN or LESSER_THAN"
          "The provided value is '$value'",
        ),
        assert(
          (type == ConditionType.IS || type == ConditionType.IS_NOT)
              ? value != null
              : true,
          "A test value is required for IS and IS_NOT conditions, but nothing was provided",
        );

  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionToJson(this);
}
