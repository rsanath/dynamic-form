import '../action/action.dart';
import '../condition/condition.dart';

part 'rule.g.dart';

/// Defines an effect that might occur
/// when a value is inputted to a [Rule].
class Rule {
  String targetId;
  Condition condition;
  Action action;

  Rule({this.targetId, this.condition, this.action,});

  factory Rule.fromJson(Map<String, dynamic> json) => _$RuleFromJson(json);

  Map<String, dynamic> toJson() => _$RuleToJson(this);
}
