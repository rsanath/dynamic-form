import 'models/form_element/form_element.dart';

class RuleEngine {
  static final _singleton = RuleEngine._internal();

  factory RuleEngine() {
    return _singleton;
  }

  RuleEngine._internal();

  void fireRules({FormElement element, List<FormElement> elements}) {
    if (element.rules == null || element.rules.isEmpty) return;
    element.rules.forEach((rule) {
      final passed = rule.condition.evaluate(element.value);
      if (passed) {
        rule.actions.forEach(element.updateState);
      }
    });
  }

  void fireRule() {

  }

  void updateElement() {

  }
}
