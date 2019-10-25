import '../form_element/form_element.dart';

part 'form.g.dart';

class Form {
  String name;
  List<FormElement> elements;

  Form({
    this.name,
    this.elements,
  });

  bool get isValid => elements.every((element) => element.isValid);

  bool get isInvalid => !isValid;

  List<String> get validationErrors {
    return elements
        .where((element) => element.isInvalid)
        .map((element) => "${element.label} is invalid");
  }

  factory Form.fromJson(Map<String, dynamic> json) => _$FormFromJson(json);

  Map<String, dynamic> toJson() => _$FormToJson(this);
}
