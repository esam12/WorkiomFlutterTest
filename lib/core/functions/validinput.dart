import 'package:get/get.dart';

final RegExp validCharacters = RegExp(r'^[a-zA-Z][a-zA-Z0-9-]*$');
final RegExp onlyLetters = RegExp(r'^[a-zA-Z]');

validinput(String val, int min, int max, String type) {
  if (type == "tenantname") {
    if (!GetUtils.isUsername(val) && !validCharacters.hasMatch(val)) {
      return "value will be start a small letter";
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "not valid email";
    }
  }
  if (type == "text") {
    if (!GetUtils.isUsername(val) && validCharacters.hasMatch(val)) {
      return "not valid text it be only letters";
    }
  }

  if (val.length < min) {
    return "value can't be less than $min";
  }

  if (val.length > max) {
    return "value can't be larger than $max";
  }

  if (val.isEmpty) {
    return "val can't be empty";
  }
}
