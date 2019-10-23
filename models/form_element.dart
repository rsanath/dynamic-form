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
}
