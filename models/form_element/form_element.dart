import '../rule/rule.dart';
import 'element_type.dart';

part 'form_element.g.dart';

/// An individual FormElement element.
class FormElement {
  String key;
  String label;
  String value;
  ElementType type;
  String initialValue;
  String defaultValue;
  bool required;
  bool disabled;
  bool visible;
  List<String> choices; // only for choice type
  List<Rule> rules;

  FormElement({
    this.key,
    this.label,
    this.value,
    this.type,
    this.initialValue,
    this.defaultValue,
    this.required = false,
    this.disabled = false,
    this.visible = true,
    this.choices = const [],
    this.rules,
  })  : assert(key != null),
        assert(type != null);

  factory FormElement.fromJson(Map<String, dynamic> json) =>
      _$FormElementFromJson(json);

  Map<String, dynamic> toJson() => _$FormElementToJson(this);
}
