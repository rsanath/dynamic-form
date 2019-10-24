import '../action/action.dart';
import '../condition/condition.dart';

part 'rule.g.dart';

/// Defines a set of effects that might occur
/// when a value is inputted to a [Rule].
class Rule {
  Condition condition;
  List<Action> actions;

  Rule({
    this.condition,
    this.actions,
  });

  factory Rule.fromJson(Map<String, dynamic> json) => _$RuleFromJson(json);

  Map<String, dynamic> toJson() => _$RuleToJson(this);
}
