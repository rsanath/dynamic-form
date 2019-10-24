import 'models/form_element/form_element.dart';

void fireRules({FormElement element, List<FormElement> elements}) {
  if (element.rules == null || element.rules.isEmpty) return;

  element.rules.forEach((rule) {
    final passed = rule.condition.evaluate(element.value);
    if (passed) {
      rule.actions.forEach((action) {
        var target = findElement(elements, action.targetKey);
        target.updateState(action);
      });
    }
  });
}

FormElement findElement(List<FormElement> elements, String key) {
  return elements.firstWhere((e) => e.key == key);
}
