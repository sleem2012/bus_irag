import 'package:freezed_annotation/freezed_annotation.dart';
part 'fields_union.freezed.dart';

@freezed
class DUIFieldsType with _$DUIFieldsType {
  const factory DUIFieldsType.textField() = DUIFieldsTypeTextField;
  const factory DUIFieldsType.checkbox() = DUIFieldsTypeCheckbox;
  const factory DUIFieldsType.radioButton() = DUIFieldsTypeRadioButton;
  const factory DUIFieldsType.dropDownButton() = DUIFieldsTypeDropDownButton;
  const factory DUIFieldsType.dateTimePiker() = DUIFieldsTypeDateTimePiker;
  const factory DUIFieldsType.fileInput() = DUIFieldsTypeFileInput;
  const factory DUIFieldsType.imageInput() = DUIFieldsTypeImageInput;

  static const List<String> types = ['text', 'Checkbox', 'RadioButton', 'DropDownButton', 'DateTimePiker', 'file', 'ImageInput'];

  static DUIFieldsType fromString(String? type) {
    switch (type) {
      case 'text':
        return const DUIFieldsType.textField();
      case 'Checkbox':
        return const DUIFieldsType.checkbox();
      case 'RadioButton':
        return const DUIFieldsType.radioButton();
      case 'DropDownButton':
        return const DUIFieldsType.dropDownButton();
      case 'DateTimePiker':
        return const DUIFieldsType.dateTimePiker();
      case 'file':
        return const DUIFieldsType.fileInput();
      case 'ImageInput':
        return const DUIFieldsType.imageInput();
      default:
        return const DUIFieldsType.textField();
    }
  }
}

// flutter pub run build_runner watch --delete-conflicting-outputs
