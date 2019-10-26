import 'models/form/form.dart';
import 'models/form_field/field_type.dart';
import 'models/form_field/form_field.dart';
import 'rule_engine.dart';
import 'util.dart';
import 'validator.dart';

/// The API to access the [Form].
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

  List<FormField> get fields => _form.fields;

  void setValue(int index, String value) {
    var field = fields[index];

    if (field.disabled) return;
    if (!_isApplicable(field, value)) return;

    _form.setValue(index, value);
    _ruleEngine.executeRules(fields: fields, field: field);
  }

  bool _isApplicable(FormField field, String value) {
    final type = field.type;
    if (type == FieldType.NUMBER && parseInt(value) == null) {
      return false;
    }
    if (type == FieldType.CHOICE && !field.choices.contains(value)) {
      return false;
    }
    return true;
  }

  List<String> validate() => _validator.validate(fields);

  Map<String, String> submit() {
    final validationErrors = validate();
    if (validationErrors.isNotEmpty) return null;

    Map<String, String> formValues = {};
    fields
        .where((e) => !e.disabled)
        .forEach((e) => formValues[e.label] = e.value);
    return formValues;
  }
}
