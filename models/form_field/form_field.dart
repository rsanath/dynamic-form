import '../action/action.dart';
import '../action/action_type.dart';
import '../rule/rule.dart';
import '../validation/validation.dart';
import 'field_type.dart';

part 'form_field.g.dart';

/// An individual form field.
class FormField {
  String key;
  String label;
  String value;
  FieldType type;
  String initialValue;
  String defaultValue;
  bool disabled;
  bool visible;
  List<Validation> validations;
  List<String> choices; // only for choice type
  List<Rule> rules;

  FormField({
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

  factory FormField.fromJson(Map<String, dynamic> json) =>
      _$FormFieldFromJson(json);

  Map<String, dynamic> toJson() => _$FormFieldToJson(this);
}