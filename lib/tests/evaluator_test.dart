import '../evaluator.dart';
import '../models/condition/condition.dart';
import '../models/condition/condition_type.dart';
import '../rule_engine.dart';
import 'test_helper.dart';

RuleEngine ruleEngine = RuleEngine();

void main() {
  testEvaluator();
}

testEvaluator() {
  printTestName("Evaluator Test");
  evaluateCondition_IS();
  evaluateCondition_IS_NOT();
  evaluateCondition_CONTAINS();
  evaluateCondition_IS_EMPTY();
  evaluateCondition_IS_NOT_EMPTY();
  evaluateCondition_GREATER_THAN();
  evaluateCondition_GREATER_THAN_shouldFailOnNonNumericInput();
  evaluateCondition_LESSER_THAN();
  evaluateCondition_LESSER_THAN_shouldFailOnNonNumericInput();
}

evaluateCondition_IS() {
  final condition = Condition(type: ConditionType.IS, value: "test");

  final trueResult = evaluateCondition(condition, "test");
  final falseResult = evaluateCondition(condition, "something else");

  assertAllTrue(
    [
      trueResult == true,
      falseResult == false,
    ],
    testName: "evaluateCondition_IS",
  );
}

evaluateCondition_IS_NOT() {
  final condition = Condition(type: ConditionType.IS_NOT, value: "apple");

  final trueResult = evaluateCondition(condition, "orange");
  final falseResult = evaluateCondition(condition, "apple");

  assertAllTrue(
    [
      trueResult == true,
      falseResult == false,
    ],
    testName: "evaluateCondition_IS_NOT",
  );
}

evaluateCondition_CONTAINS() {
  final condition = Condition(type: ConditionType.CONTAINS, value: "999");

  final trueResult = evaluateCondition(condition, "111999111");
  final falseResult = evaluateCondition(condition, "_-_-_-");

  assertAllTrue(
    [
      trueResult == true,
      falseResult == false,
    ],
    testName: "evaluateCondition_CONTAINS",
  );
}

evaluateCondition_IS_EMPTY() {
  final condition = Condition(type: ConditionType.IS_EMPTY);

  final trueResult1 = evaluateCondition(condition, null);
  final trueResult2 = evaluateCondition(condition, "");
  final falseResult = evaluateCondition(condition, "non empty value");

  assertAllTrue(
    [
      trueResult1 == true,
      trueResult2 == true,
      falseResult == false,
    ],
    testName: "evaluateCondition_IS_EMPTY",
  );
}

evaluateCondition_IS_NOT_EMPTY() {
  final trueCondition = Condition(type: ConditionType.IS_NOT_EMPTY);
  final trueResult = evaluateCondition(trueCondition, "not empty");

  final falseCondition = Condition(type: ConditionType.IS_NOT_EMPTY);
  final falseResult = evaluateCondition(falseCondition, "");

  assertAllTrue(
    [
      trueResult == true,
      falseResult == false,
    ],
    testName: "evaluateCondition_IS_NOT_EMPTY",
  );
}

evaluateCondition_GREATER_THAN() {
  var condition = Condition(type: ConditionType.GREATER_THAN, value: "30");
  var trueResult = evaluateCondition(condition, "44");
  var falseResult = evaluateCondition(condition, "10");

  assertAllTrue(
    [
      trueResult == true,
      falseResult == false,
    ],
    testName: "evaluateCondition_GREATER_THAN",
  );
}

evaluateCondition_GREATER_THAN_shouldFailOnNonNumericInput() {
  final condition = Condition(type: ConditionType.GREATER_THAN, value: "10");
  final result = evaluateCondition(condition, "non numeric");

  assertEquals(
    actual: result,
    expected: false,
    testName: "evaluateCondition_GREATER_THAN_shouldFailOnNonNumericInput",
  );
}

evaluateCondition_LESSER_THAN() {
  var condition = Condition(type: ConditionType.LESSER_THAN, value: "30");
  var trueResult = evaluateCondition(condition, "3");
  var falseResult = evaluateCondition(condition, "100");

  assertAllTrue(
    [
      trueResult == true,
      falseResult == false,
    ],
    testName: "evaluateCondition_LESSER_THAN",
  );
}

evaluateCondition_LESSER_THAN_shouldFailOnNonNumericInput() {
  final condition = Condition(type: ConditionType.LESSER_THAN, value: "10");
  final result = evaluateCondition(condition, "non numeric");

  assertEquals(
    actual: result,
    expected: false,
    testName: "evaluateCondition_LESSER_THAN_shouldFailOnNonNumericInput",
  );
}
