import 'action_type.dart';

part 'action.g.dart';

/// A definition for what should happen when a [Rule] is passed.
class Action {
  String targetKey;
  ActionType type;
  String value;

  Action({
    this.targetKey,
    this.type,
    this.value,
  });

  factory Action.fromJson(Map<String, dynamic> json) => _$ActionFromJson(json);

  Map<String, dynamic> toJson() => _$ActionToJson(this);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Action &&
          runtimeType == other.runtimeType &&
          targetKey == other.targetKey &&
          type == other.type &&
          value == other.value;

  @override
  int get hashCode => targetKey.hashCode ^ type.hashCode ^ value.hashCode;
}
