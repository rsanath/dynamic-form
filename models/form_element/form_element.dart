import '../rule/rule.dart';
import 'element_type.dart';

part 'form_element.g.dart';

/// An individual FormElement element.
class FormElement {
  String id;
  String label;
  String value;
  ElementType type;
  String placeholder;
  String initialValue;
  String defaultValue;
  bool required;
  bool disabled;
  List<String> choices; // only for choice type
  List<Rule> onInput;

  FormElement({
    this.id,
    this.label,
    this.value,
    this.type,
    this.placeholder,
    this.initialValue,
    this.defaultValue,
    this.required = false,
    this.disabled = false,
    this.choices = const [],
    this.onInput,
  })  : assert(id != null),
        assert(type != null);

  factory FormElement.fromJson(Map<String, dynamic> json) => _$FormElementFromJson(json);

  Map<String, dynamic> toJson() => _$FormElementToJson(this);
}
