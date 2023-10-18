import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workiomtest/core/class/statusrequest.dart';
import 'package:workiomtest/core/constant/routes.dart';
import 'package:workiomtest/data/datasource/remote/auth/login_data.dart';

abstract class LoginController extends GetxController {
  logIn();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> fromstate = GlobalKey<FormState>();
  late TextEditingController email, password, tenantname;
  StatusRequest statusRequest = StatusRequest.none;
  LoginData loginData = LoginData(Get.find());

  @override
  logIn() async {
    var formdata = fromstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response =
          await loginData.postData(password.text, tenantname.text, email.text);
      if (response['success']) {
        statusRequest = StatusRequest.success;
        update();
        Get.offAllNamed(AppRoute.loginSuccessPage);
      } else {
        Get.defaultDialog(
            title: "Waring", middleText: "${response['error']['message']}");
        statusRequest = StatusRequest.failure;
        update();
      }
      update();
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    tenantname = TextEditingController();
    super.onInit();
  }
}
