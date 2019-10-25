import '../action/action.dart';
import '../action/action_type.dart';
import '../rule/rule.dart';
import '../validation/validation.dart';
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
  bool disabled;
  bool visible;
  List<Validation> validations;
  List<String> choices; // only for choice type
  List<Rule> rules;

  FormElement({
    this.key,
    this.label,
    this.value,
    this.type,
    this.initialValue,
    this.defaultValue,
    this.disabled = false,
    this.visible = true,
    this.validations = const [],
    this.choices = const [],
    this.rules,
  })  : assert(key != null),
        assert(type != null);

  bool get isValid {
    return validations.every((validation) => validation.validate(value));
  }

  bool get isInvalid => !isValid;

  void updateState(Action action) {
    switch (action.type) {
      case ActionType.ENABLE:
        disabled = false;
        break;
      case ActionType.DISABLE:
        disabled = true;
        break;
      case ActionType.SHOW:
        visible = true;
        break;
      case ActionType.HIDE:
        visible = false;
        break;
      case ActionType.SET:
        value = action.value;
        break;
    }
  }

  @override
  String toString() {
    final visibleText = (visible ? 'visible' : 'invisible').padRight(10);
    final disabledText = (disabled ? 'disabled' : 'enabled');
    return "${label.padRight(25)} = $value ($visibleText, $disabledText)";
  }

  factory FormElement.fromJson(Map<String, dynamic> json) =>
      _$FormElementFromJson(json);

  Map<String, dynamic> toJson() => _$FormElementToJson(this);
}
