import 'models/form_field/form_field.dart';

class RuleEngine {
  static final _singleton = RuleEngine._internal();

  factory RuleEngine() {
    return _singleton;
  }

  RuleEngine._internal();

  void executeRules({FormField field, List<FormField> fields}) {
    if (field.rules == null || field.rules.isEmpty) return;

    field.rules.forEach((rule) {
      final passed = rule.condition.evaluate(field.value);
      if (passed) {
        rule.actions.forEach((action) {
          var target = _findField(fields, action.targetKey);
          target.updateState(action);
        });
      }
    });
  }

  FormField _findField(List<FormField> fields, String key) {
    return fields.firstWhere((e) => e.key == key);
  }
}
