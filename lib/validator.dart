import 'models/condition/condition.dart';
import 'models/condition/condition_type.dart';
import 'models/form_field/form_field.dart';
import 'util.dart';

/// A functional class that executes [Validation]s.
class Validator {
  static final _singleton = Validator._internal();

  factory Validator() {
    return _singleton;
  }

  Validator._internal();

  /// Validates all the enabled fields in the given list.
  /// Generates an error message for every failed [Validation].
  ///
  /// Returns a list of errors messages if any or empty list.
  List<String> validate(List<FormField> fields) {
    final errors = List<String>();
    fields.where((field)  {
      return !field.disabled;
    }).forEach((field) {
      errors.addAll(_validateField(field));
    });
    return errors;
  }

  List<String> _validateField(FormField field) {
    final errors = List<String>();
    if (field.validations == null || field.validations.isEmpty) {
      return errors;
    }
    for (var validation in field.validations) {
      final error = _isValid(
        validation: validation,
        label: field.label,
        value: field.value ?? field.defaultValue,
      );
      if (error != null) {
        errors.add(error);
      }
    }
    return errors;
  }

  String _isValid({Condition validation, String label, String value}) {
    switch (validation.type) {
      case ConditionType.CONTAINS:
        if (!(value?.contains(validation.value) ?? false)) {
          return "${label} should contain ${validation.value}";
        }
        break;
      case ConditionType.IS:
        if (value != validation.value) {
          return "${label} should be ${validation.value}";
        }
        break;
      case ConditionType.IS_NOT:
        if (value == validation.value) {
          return "${label} should not be ${validation.value}";
        }
        break;
      case ConditionType.IS_EMPTY:
        if (value != null || value != "") {
          return "${label} should be empty";
        }
        break;
      case ConditionType.IS_NOT_EMPTY:
        if (value == null || value == "") {
          return "${label} should not be empty";
        }
        break;
      case ConditionType.GREATER_THAN:
        final number = parseInt(value);
        final expected = parseInt(validation.value);
        if (number == null || expected == null || number < expected) {
          return "$label should be a number greater than $expected";
        }
        break;
      case ConditionType.LESSER_THAN:
        final number = parseInt(value);
        final expected = parseInt(validation.value);
        if (number == null || expected == null || number > expected) {
          return "$label should be a number lesser than $expected";
        }
        break;
    }
    return null;
  }
}
