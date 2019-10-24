import '../action/action.dart';
import '../condition/condition.dart';

/// Defines an effect that might occur
/// when a value is inputted to a [FormElement].
class Rule {
  String targetId;
  Condition condition;
  Action action;
}
