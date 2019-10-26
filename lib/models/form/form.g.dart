// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Form _$FormFromJson(Map<String, dynamic> json) {
  return Form(
    name: json['name'] as String,
    fields: (json['fields'] as List)
        ?.map((e) =>
            e == null ? null : FormField.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$FormToJson(Form instance) => <String, dynamic>{
      'name': instance.name,
      'fields': instance.fields,
    };
