import 'models/form/form.dart';
import 'models/form_element/form_element.dart';
import 'rule_engine.dart';

/// The API to access the [Form].
class FormController {
  Form form;

  FormController({
    this.form,
  }) : assert(form != null);

  List<FormElement> get elements => form.elements;

  void setValueAtIndex(int index, String value) {
    var element = elements[index];
    element.value = value;
    fireRules(elements: elements, element: element);
  }

  Map<String, String> submit() {
    Map<String, String> formValues = {};

    elements
        .where((e) => !e.disabled)
        .forEach((e) => formValues[e.label] = e.value);

    return formValues;
  }
}
