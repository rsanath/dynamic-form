import 'action_type.dart';

part 'action.g.dart';

/// Defines what should be done when a [Rule] is passed
class Action {
  ActionType type;
  String value;

  Action({
    this.type,
    this.value,
  });

  factory Action.fromJson(Map<String, dynamic> json) => _$ActionFromJson(json);

  Map<String, dynamic> toJson() => _$ActionToJson(this);
}
