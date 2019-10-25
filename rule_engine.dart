import 'models/form_field/form_field.dart';

void fireRules({FormField field, List<FormField> fields}) {
  if (field.rules == null || field.rules.isEmpty) return;

  field.rules.forEach((rule) {
    final passed = rule.condition.evaluate(field.value);
    if (passed) {
      rule.actions.forEach((action) {
        var target = findField(fields, action.targetKey);
        target.updateState(action);
      });
    }
  });
}

FormField findField(List<FormField> fields, String key) {
  return fields.firstWhere((e) => e.key == key);
}
