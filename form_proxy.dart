import 'models/form/form.dart';
import 'models/form_field/field_type.dart';
import 'models/form_field/form_field.dart';
import 'rule_engine.dart';
import 'util.dart';

/// The API to access the [Form].
class FormProxy {
  Form _form;

  FormProxy(this._form) : assert(_form != null);

  String get name => _form.name;

  List<FormField> get fields => _form.fields;

  void setValueAtIndex(int index, String value) {
    var field = fields[index];
    _setValue(field, value);
    executeRules(fields: fields, field: field);
  }

  /// Checks whether the inputted value is appropriate for the field type
  /// and then sets it.
  void _setValue(FormField field, String value) {
    if (field.disabled) return;

    var type = field.type;
    if (type == FieldType.NUMBER && parseInt(value) == null) {
      return;
    }
    if (type == FieldType.CHOICE && !field.choices.contains(value)) {
      return;
    }
    field.value = value;
    return;
  }

  Map<String, String> submit() {
    Map<String, String> formValues = {};
    fields
        .where((e) => !e.disabled)
        .forEach((e) => formValues[e.label] = e.value);
    return formValues;
  }
}
