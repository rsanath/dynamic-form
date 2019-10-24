import '../form_element/form_element.dart';

part 'form.g.dart';

class Form {
  String name;
  List<FormElement> elements;

  Form({
    this.name,
    this.elements,
  });

  Map<String, String> submit() {
    Map<String, String> formValues = {};

    elements.forEach((e) {
      if (e.disabled) return;
      formValues[e.label] = e.value;
    });

    return formValues;
  }

  factory Form.fromJson(Map<String, dynamic> json) => _$FormFromJson(json);

  Map<String, dynamic> toJson() => _$FormToJson(this);
}
