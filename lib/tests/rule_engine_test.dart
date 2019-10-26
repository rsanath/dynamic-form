import '../models/action/action.dart';
import '../models/action/action_type.dart';
import '../models/condition/condition.dart';
import '../models/condition/condition_type.dart';
import '../models/form_field/field_type.dart';
import '../models/form_field/form_field.dart';
import '../models/rule/rule.dart';
import '../rule_engine.dart';
import 'test_helper.dart';

RuleEngine ruleEngine = RuleEngine();

void main() {
  testRuleEngine();
}

testRuleEngine() {
  printTestName("Rule Engine Test");
  executeRule_EnableTargetOnRulePass();
  executeRule_DisableTargetsOnRulePass();
}

executeRule_EnableTargetOnRulePass() {
  List<FormField> fields = [
    FormField(
      key: "criminal",
      label: "criminal",
      type: FieldType.TEXT,
      value: "weapons,drugs",
      rules: [
        Rule(
          condition: Condition(
            type: ConditionType.CONTAINS,
            value: "weapon",
          ),
          actions: [
            Action(
              targetKey: "police",
              type: ActionType.ENABLE,
            ),
            Action(
              targetKey: "police",
              type: ActionType.SHOW,
            )
          ],
        ),
      ],
    ),
    FormField(
      key: "police",
      label: "police",
      type: FieldType.TEXT,
      value: "police",
      disabled: true,
      visible: false,
    ),
  ];

  ruleEngine.executeRules(fields: fields, field: fields[0]);

  assertAllTrue(
    [
      fields[1].disabled == false,
      fields[1].visible = true,
    ],
    testName: "executeRule_EnableTargetOnRulePass",
  );
}

executeRule_DisableTargetsOnRulePass() {
  List<FormField> fields = [
    FormField(
      key: "age",
      label: "age",
      type: FieldType.NUMBER,
      value: "17",
      rules: [
        Rule(
          condition: Condition(
            type: ConditionType.LESSER_THAN,
            value: "18",
          ),
          actions: [
            Action(
              targetKey: "cigarette",
              type: ActionType.DISABLE,
            ),
            Action(
              targetKey: "cigarette",
              type: ActionType.HIDE,
            ),
            Action(
              targetKey: "beer",
              type: ActionType.DISABLE,
            ),
            Action(
              targetKey: "beer",
              type: ActionType.HIDE,
            )
          ],
        ),
      ],
    ),
    FormField(
      key: "beer",
      label: "beer",
      type: FieldType.TEXT,
      value: "beer",
      disabled: false,
      visible: true,
    ),
    FormField(
      key: "cigarette",
      label: "cigarette",
      type: FieldType.TEXT,
      value: "cigarette",
      disabled: false,
      visible: true,
    ),
  ];

  ruleEngine.executeRules(field: fields[0], fields: fields);

  assertAllTrue(
    [
      fields[1].disabled == true,
      fields[1].visible == false,
      fields[2].disabled == true,
      fields[2].visible == false,
    ],
    testName: "executeRule_DisableTargetsOnRulePass",
  );
}
