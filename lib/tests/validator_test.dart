import '../models/condition/condition.dart';
import '../models/condition/condition_type.dart';
import '../models/form_field/field_type.dart';
import '../models/form_field/form_field.dart';
import '../validator.dart';
import 'test_helper.dart';

final validator = Validator();

void main() {
  testValidator();
}

void testValidator() {
  printTestName("Validator Test");
  validate_IsNot_ShouldBeInvalid();
  validate_IsNotEmpty_ShouldBeInvalid();
  validate_IsNotEmpty_ShouldBeValidWithDefaultValue();
  validate_Contains_shouldBeValid();
  validate_Is_ShouldBeValidWithInitialValue();
  validate_GreaterThanAndLesserThan_ShouldBeValid();
  validate_GreaterThanAndLesserThan_ShouldBeInvalid();
  validate_Everything_ShouldBeInvalid();
}

validate_IsNotEmpty_ShouldBeInvalid() {
  final fields = [
    FormField(
      key: "",
      label: "test field",
      type: FieldType.TEXT,
      value: "",
      validations: [Condition(type: ConditionType.IS_NOT_EMPTY)],
    ),
  ];
  final errors = validator.validate(fields);
  assertEquals(
    testName: "validate_IsNotEmpty_ShouldBeInvalid",
    actual: errors.length,
    expected: 1,
  );
}

validate_IsNotEmpty_ShouldBeValidWithDefaultValue() {
  final fields = [
    FormField(
      key: "",
      label: "test field",
      type: FieldType.TEXT,
      defaultValue: "default value",
      validations: [Condition(type: ConditionType.IS_NOT_EMPTY)],
    ),
  ];
  final errors = validator.validate(fields);
  assertEquals(
    testName: "validate_IsNotEmpty_ShouldBeValidWithDefaultValue",
    actual: errors.length,
    expected: 0,
  );
}

validate_IsNot_ShouldBeInvalid() {
  final fields = [
    FormField(
      key: "",
      label: "test field",
      type: FieldType.TEXT,
      value: "ape",
      validations: [
        Condition(
          type: ConditionType.IS_NOT,
          value: "ape"
        ),
      ],
    ),
  ];
  final errors = validator.validate(fields);
  assertEquals(
    testName: "validate_IsNot_ShouldBeInvalid",
    actual: errors.length,
    expected: 1,
  );
}

validate_Contains_shouldBeValid() {
  final fields = [
    FormField(
      key: "",
      label: "test field",
      type: FieldType.TEXT,
      value: "needle in a haystack",
      validations: [
        Condition(type: ConditionType.CONTAINS, value: "needle"),
      ],
    ),
  ];
  final errors = validator.validate(fields);
  assertEquals(
    testName: "validate_Contains_shouldBeValid",
    actual: errors.length,
    expected: 0,
  );
}

validate_Is_ShouldBeValidWithInitialValue() {
  final fields = [
    FormField(
      key: "",
      label: "test field",
      type: FieldType.TEXT,
      initialValue: "ape",
      validations: [
        Condition(type: ConditionType.IS, value: "ape"),
      ],
    ),
  ];
  final errors = validator.validate(fields);
  assertEquals(
    testName: "validate_Is_ShouldBeValidWithInitialValue",
    actual: errors.length,
    expected: 0,
  );
}

validate_Is_ShouldBeInValid() {
  final fields = [
    FormField(
      key: "",
      label: "test field",
      type: FieldType.TEXT,
      initialValue: "ape",
      validations: [
        Condition(type: ConditionType.IS, value: "gorilla"),
      ],
    ),
  ];
  final errors = validator.validate(fields);
  assertEquals(
    testName: "validate_Is_ShouldBeInValid",
    actual: errors.length,
    expected: 1,
  );
}

validate_GreaterThanAndLesserThan_ShouldBeValid() {
  final fields = [
    FormField(
      key: "",
      label: "test field",
      type: FieldType.NUMBER,
      initialValue: "4",
      validations: [
        Condition(type: ConditionType.GREATER_THAN, value: "1"),
        Condition(type: ConditionType.LESSER_THAN, value: "5"),
      ],
    ),
  ];
  final errors = validator.validate(fields);
  assertEquals(
    testName: "validate_GreaterThanAndLesserThan_ShouldBeValid",
    actual: errors.length,
    expected: 0,
  );
}

validate_GreaterThanAndLesserThan_ShouldBeInvalid() {
  final fields = [
    FormField(
      key: "",
      label: "test field",
      type: FieldType.NUMBER,
      initialValue: "6",
      validations: [
        Condition(type: ConditionType.GREATER_THAN, value: "1"),
        Condition(type: ConditionType.LESSER_THAN, value: "5"),
      ],
    ),
  ];
  final errors = validator.validate(fields);
  assertEquals(
    testName: "validate_GreaterThanAndLesserThan_ShouldBeValid",
    actual: errors.length,
    expected: 1,
  );
}

validate_Everything_ShouldBeInvalid() {
  final fields = [
    FormField(
        key: "test_CONTAINS",
        label: "test_CONTAINS",
        type: FieldType.TEXT,
        value: "banana,avacado,apple",
        validations: [
          Condition(type: ConditionType.CONTAINS, value: "orange")
        ]),
    FormField(
        key: "test_IS",
        label: "test_IS",
        type: FieldType.TEXT,
        value: "orange",
        validations: [Condition(type: ConditionType.IS, value: "apple")]),
    FormField(
      key: "test_IS_EMPTY",
      label: "test_IS_EMPTY",
      type: FieldType.TEXT,
      value: "apple",
      validations: [Condition(type: ConditionType.IS_EMPTY)],
    ),
    FormField(
      key: "test_IS_NOT_EMPTY",
      label: "test_IS_NOT_EMPTY",
      type: FieldType.TEXT,
      validations: [Condition(type: ConditionType.IS_NOT_EMPTY)],
    ),
    FormField(
      key: "test_GREATER_THAN",
      label: "test_GREATER_THAN",
      type: FieldType.TEXT,
      value: "11",
      validations: [
        Condition(type: ConditionType.GREATER_THAN, value: "100"),
      ],
    ),
    FormField(
      key: "test_LESSER_THAN",
      label: "test_LESSER_THAN",
      type: FieldType.TEXT,
      value: "11",
      validations: [
        Condition(type: ConditionType.LESSER_THAN, value: "4"),
      ],
    ),
  ];
  final errors = validator.validate(fields);
  assertEquals(
    testName: "validate_Everything_ShouldBeInvalid",
    actual: errors.length,
    expected: fields.length,
  );
}
