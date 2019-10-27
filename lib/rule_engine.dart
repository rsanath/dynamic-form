import 'evaluator.dart';
import 'models/action/action.dart';
import 'models/action/action_type.dart';
import 'models/condition/condition.dart';
import 'models/form_field/form_field.dart';

/// A functional class that evaluates a [Rule]'s  [Condition] and performs
/// set of [Action]s on a [FormField] based on the outcome.
class RuleEngine {
  static final _singleton = RuleEngine._internal();

  factory RuleEngine() {
    return _singleton;
  }

  RuleEngine._internal();

  /// Executes the given [FormField]'s [Rule]s and performs the specified
  /// [Action]s on the target [FormField].
  ///
  /// Does nothing if the target [FormField] is not found.
  void executeRules({FormField field, List<FormField> fields}) {
    if (field.rules == null || field.rules.isEmpty) return;

    field.rules.forEach((rule) {
      final passed = evaluateCondition(rule.condition, field.value);
      if (passed) {
        rule.actions.forEach((action) {
          final target = _findField(fields, action.targetKey);
          if (target == null) return;
          _updateField(target, action);
        });
      }
    });
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
    return fields.firstWhere((e) => e.key == key, orElse: () => null);
  }
}
