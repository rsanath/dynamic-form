import '../form_element/form_element.dart';

part 'form.g.dart';

class Form {
  String name;
  List<FormElement> elements;

  Form({
    this.name,
    this.elements,
  });

  factory Form.fromJson(Map<String, dynamic> json) => _$FormFromJson(json);

  Map<String, dynamic> toJson() => _$FormToJson(this);
}
