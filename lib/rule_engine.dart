import 'models/action/action.dart';
import 'models/action/action_type.dart';
import 'models/condition/condition.dart';
import 'models/condition/condition_type.dart';
import 'models/form_field/form_field.dart';
import 'util.dart';

class RuleEngine {
  static final _singleton = RuleEngine._internal();

  factory RuleEngine() {
    return _singleton;
  }

  RuleEngine._internal();

  void executeRules({FormField field, List<FormField> fields}) {
    if (field.rules == null || field.rules.isEmpty) return;

    field.rules.forEach((rule) {
      final passed = _evaluateCondition(rule.condition, field.value);
      if (passed) {
        rule.actions.forEach((action) {
          var target = _findField(fields, action.targetKey);
          _updateField(target, action);
        });
      }
    });
  }

  bool _evaluateCondition(Condition condition, String givenValue) {
    switch (condition.type) {
      case ConditionType.IS:
        return givenValue == condition.value;
      case ConditionType.IS_NOT:
        return givenValue != condition.value;
      case ConditionType.CONTAINS:
        return givenValue?.contains(condition.value) ?? false;
      case ConditionType.IS_EMPTY:
        return givenValue?.isEmpty ?? true;
      case ConditionType.IS_NOT_EMPTY:
        return givenValue?.isNotEmpty ?? false;
      case ConditionType.GREATER_THAN:
        final number = parseInt(givenValue);
        final expected = parseInt(condition.value);
        if (number == null || expected == number) return false;
        return number > expected;
      case ConditionType.LESSER_THAN:
        final number = parseInt(givenValue);
        final expected = parseInt(condition.value);
        if (number == null || expected == number) return false;
        return number < expected;
    }
    return false;
  }

  void _updateField(FormField target, Action action) {
    switch (action.type) {
      case ActionType.ENABLE:
        target.disabled = false;
        break;
      case ActionType.DISABLE:
        target.disabled = true;
        break;
      case ActionType.SHOW:
        target.visible = true;
        break;
      case ActionType.HIDE:
        target.visible = false;
        break;
    }
  }

  FormField _findField(List<FormField> fields, String key) {
    return fields.firstWhere((e) => e.key == key);
  }
}
