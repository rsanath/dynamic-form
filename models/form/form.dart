import '../form_element/form_element.dart';

class Form {
  String name;
  List<FormElement> elements;

  Map<String, String> submit() {
    Map<String, String> formValues = {};

    elements.forEach((e) {
      if (e.disabled) return;
      formValues[e.label] = e.value;
    });

    return formValues;
  }
}
