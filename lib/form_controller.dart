import 'models/form/form.dart';
import 'models/form_field/field_type.dart';
import 'models/form_field/form_field.dart';
import 'rule_engine.dart';
import 'util.dart';
import 'validator.dart';

/// A proxy to interact and control the [Form].
class FormController {
  Form _form;
  RuleEngine _ruleEngine;
  Validator _validator;

  FormController({
    Form form,
    RuleEngine ruleEngine,
    Validator validator,
  })  : _form = form,
        _ruleEngine = ruleEngine,
        _validator = validator,
        assert(form != null),
        assert(validator != null),
        assert(ruleEngine != null);

  String get name => _form.name;

  /// Provides read only access to the form fields.
  List<FormField> get fields => List.unmodifiable(_form.fields);

  /// Sets the given value for the field at given index if
  ///   * The field is not disabled and
  ///   * The given value is appropriate for the [FieldType].
  ///
  /// Then triggers the [Rule]s for that [FormField].
  void setValue(int index, String value) {
    var field = fields[index];

    if (!_isApplicable(field, value)) return;

    _form.setValue(index, value);
    _ruleEngine.executeRules(fields: fields, field: field);
  }

  bool _isApplicable(FormField field, String value) {
    if (field.disabled) return false;

    final type = field.type;
    if (type == FieldType.NUMBER && parseInt(value) == null) {
      return false;
    }
    if (type == FieldType.CHOICE && !field.choices.contains(value)) {
      return false;
    }
    return true;
  }

  /// Checks if the values for the [FormField]s are valid.
  /// Returns a list of error messages if invalid else an empty list.
  List<String> validate() => _validator.validate(fields);

  /// Returns the [FormField.label], [FormField.value] pair of all
  /// the non disabled [FormField]s if the [Form] is valid.
  ///
  /// Note: Considers the [FormField.defaultValue] if the [FormField.value]
  /// is not present.
  Map<String, String> submit() {
    final validationErrors = validate();
    if (validationErrors.isNotEmpty) return null;

    Map<String, String> formValues = {};
    fields
        .where((e) => !e.disabled)
        .forEach((e) => formValues[e.label] = e.value ?? e.defaultValue);
    return formValues;
  }
}
