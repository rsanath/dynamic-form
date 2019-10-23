import 'element_type.dart';
import 'rule.dart';

/// An individual form element.
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
}
