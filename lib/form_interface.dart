import 'models/form_field/form_field.dart';

abstract class IForm {
  List<FormField> get fields;

  void setValue(int index, String value);

  Map<String, String> submit();
}