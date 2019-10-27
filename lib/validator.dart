import 'evaluator.dart';
import 'models/condition/condition.dart';
import 'models/condition/condition_type.dart';
import 'models/form_field/form_field.dart';

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
    fields.where((field) {
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
      final error = _getValidationMessage(
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

  String _getValidationMessage({
    Condition validation,
    String label,
    String value,
  }) {
    final valid = evaluateCondition(validation, value);

    if (valid) return null;

    switch (validation.type) {
      case ConditionType.CONTAINS:
        return "${label} should contain ${validation.value}";
      case ConditionType.IS:
        return "${label} should be ${validation.value}";
      case ConditionType.IS_NOT:
        return "${label} should not be ${validation.value}";
      case ConditionType.IS_EMPTY:
        return "${label} should be empty";
      case ConditionType.IS_NOT_EMPTY:
        return "${label} should not be empty";
      case ConditionType.GREATER_THAN:
        return "$label should be a number greater than ${validation.value}";
      case ConditionType.LESSER_THAN:
        return "$label should be a number lesser than ${validation.value}";
    }

    return null;
  }
}
