import '../condition/condition.dart';
import '../rule/rule.dart';
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
  List<Condition> validations;
  List<String> choices; // only for choice type
  List<Rule> rules;

  FormField({
    this.key,
    this.label,
    this.type,
    this.defaultValue,
    this.disabled = false,
    this.visible = true,
    this.validations = const [],
    this.choices = const [],
    this.rules,
    String value,
    String initialValue,
  })  : this.value = value ?? initialValue,
        assert(key != null),
        assert(type != null);

  @override
  String toString() {
    final visibleText = (visible ? 'visible' : 'invisible');
    final disabledText = (disabled ? 'disabled' : 'enabled');
    return "${label.padRight(25)} = $value ($visibleText, $disabledText)";
  }

  factory FormField.fromJson(Map<String, dynamic> json) =>
      _$FormFieldFromJson(json);

  Map<String, dynamic> toJson() => _$FormFieldToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FormField &&
          runtimeType == other.runtimeType &&
          key == other.key &&
          label == other.label &&
          value == other.value &&
          type == other.type &&
          initialValue == other.initialValue &&
          defaultValue == other.defaultValue &&
          disabled == other.disabled &&
          visible == other.visible &&
          validations == other.validations &&
          choices == other.choices &&
          rules == other.rules;

  @override
  int get hashCode =>
      key.hashCode ^
      label.hashCode ^
      value.hashCode ^
      type.hashCode ^
      initialValue.hashCode ^
      defaultValue.hashCode ^
      disabled.hashCode ^
      visible.hashCode ^
      validations.hashCode ^
      choices.hashCode ^
      rules.hashCode;
}
