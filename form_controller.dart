import 'dart:math';

import 'models/form/form.dart';
import 'models/form_element/form_element.dart';
import 'rule_engine.dart';

class FormController {
  Form form;

  FormController({
    this.form,
  }) : assert(form != null);

  List<FormElement> get elements => form.elements;

  List<String> get validationErrors {
    return elements
        .where((element) => element.isInvalid)
        .map((element) => "${element.label} is invalid");
  }

  void setValueAtIndex(int index, String value) {
    var element = elements[index];
    element.value = value;
    fireRules(elements: elements, element: element);
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
