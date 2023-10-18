import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:workiomtest/core/class/statusrequest.dart';
import 'package:workiomtest/core/constant/routes.dart';
import 'package:workiomtest/data/datasource/remote/auth/signup.dart';

abstract class StrongPasswordController extends GetxController {
  signUp();
}

class StrongPasswordControllerImp extends StrongPasswordController {
  GlobalKey<FormState> fromstate = GlobalKey<FormState>();

  late TextEditingController email, passwordtext;
  StatusRequest statusRequest = StatusRequest.none;
  List data = [];
  bool isShowPass = true;
  var password = ''.obs;
  var passwordStrength = 0.0.obs;
  late String editionId;
  RegExp letterRegExpress = RegExp(r".*[A-Z].*");

  SignUpData signupdata = SignUpData(Get.find());

  @override
  signUp() async {
    var formdata = fromstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      Get.offNamed(
        AppRoute.signUp_companyName,
        arguments: {
          "email": email.text,
          "password": passwordtext.text,
          "editionId": editionId,
        },
      );
      update();
    } else {}
  }

  showPassword() {
    isShowPass = isShowPass == true ? false : true;
    update();
  }

  void checkPasswordStregth(String value) {
    password.value = value.trim();
    if (password.value.isEmpty) {
      passwordStrength.value = 0.0;
    } else if (password.value.length > 0 && password.value.length <= 6) {
      passwordStrength.value = 2;
    } else if (password.value.length < 7) {
      passwordStrength.value = 1 / 3;
    } else {
      if (!letterRegExpress.hasMatch(password.value)) {
        passwordStrength.value = 2 / 3;
      } else {
        passwordStrength.value = 1;
      }
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    passwordtext = TextEditingController();
    editionId = Get.arguments['editionId'];
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    passwordtext.dispose();
    super.dispose();
  }
}
