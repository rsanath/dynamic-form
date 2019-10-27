import 'models/condition/condition.dart';
import 'models/condition/condition_type.dart';
import 'util.dart';

bool evaluateCondition(Condition condition, String givenValue) {
  switch (condition.type) {
    case ConditionType.IS:
      return givenValue == condition.value;
    case ConditionType.IS_NOT:
      return givenValue != condition.value;
    case ConditionType.CONTAINS:
      return givenValue?.contains(condition.value) ?? false;
    case ConditionType.IS_EMPTY:
      return givenValue?.isEmpty ?? true;
    case ConditionType.IS_NOT_EMPTY:
      return givenValue?.isNotEmpty ?? false;
    case ConditionType.GREATER_THAN:
      final number = parseInt(givenValue);
      final expected = parseInt(condition.value);
      if (number == null || expected == number) return false;
      return number > expected;
    case ConditionType.LESSER_THAN:
      final number = parseInt(givenValue);
      final expected = parseInt(condition.value);
      if (number == null || expected == number) return false;
      return number < expected;
  }
  return false;
}
