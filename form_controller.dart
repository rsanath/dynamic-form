import 'models/form/form.dart';
import 'models/form_element/form_element.dart';
import 'rule_engine.dart';

class FormController {
  Form form;

  FormController({
    this.form,
  }) : assert(form != null);

  List<FormElement> get elements => form.elements;

  printCurrentState() {
    for (int i = 0; i < elements.length; i++) {
      var element = elements[i];
      print("$i) ${element.label} = ${element.value}");
    }
  }

  void setValueAtIndex(int index, String value) {
    var element = elements[index];
    element.value = value;
    RuleEngine().fireRules(elements: elements, element: element);
  }

  void setValue(String key, String value) {
//    form.elements.forEach()
    printCurrentState();
  }

  Map<String, String> submit() {
    Map<String, String> formValues = {};

    elements.forEach((e) {
      if (e.disabled) return;
      formValues[e.label] = e.value;
    });

    return formValues;
  }
}
