import 'models/action/action_type.dart';
import 'models/condition/condition_type.dart';
import 'models/form/form.dart';
import 'models/form_element/form_element.dart';

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

  void setValue(String key, String value) {
    elements.forEach((e) {
      if (e.key == key) {
        e.value = value;
        if (e.rules != null || e.rules.isNotEmpty) {
          executeRules(e);
        }
      }
    });
    printCurrentState();
  }

  void executeRules(FormElement element) {

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
