import 'element_type.dart';
import 'rule.dart';

/// An individual form element.
class FormElement {
  String label;
  String placeholder;
  ElementType type;
  String initialValue;
  String defaultValue;
  List<String> choices; // only for choice type
  List<Rule> enableOn;
}
