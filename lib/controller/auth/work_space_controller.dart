import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'package:workiomtest/core/class/statusrequest.dart';
import 'package:workiomtest/core/constant/routes.dart';
import 'package:workiomtest/data/datasource/remote/auth/is_tenant_available.dart';
import 'package:workiomtest/data/datasource/remote/auth/register_tenant.dart';

abstract class CreateWorkSpace extends GetxController {
  registerTenant();
}

class CreateWorkSpaceImp extends CreateWorkSpace {
  GlobalKey<FormState> fromstate = GlobalKey<FormState>();

  late TextEditingController tenantname, firsname, lastname;
  late String email, password, editionId;
  StatusRequest statusRequest = StatusRequest.none;
  IsTenantAvailable isTenantAvailable = IsTenantAvailable(Get.find());
  RegisterTenant registertenant = RegisterTenant(Get.find());

  initialData() async {
    tenantname = TextEditingController();
    firsname = TextEditingController();
    lastname = TextEditingController();
    email = Get.arguments['email'];
    password = Get.arguments['password'];
    editionId = Get.arguments['editionId'];
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  registerTenant() async {
    var formdata = fromstate.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await isTenantAvailable.postData(tenantname.text);
      if (response['result']['tenantId'] == null) {
        var res = await registertenant.postData(
            email,
            firsname.text,
            lastname.text,
            password,
            editionId,
            tenantname.text,
            tenantname.text);
        if (res['success'] == true) {
          Get.snackbar('Success', "You will get the tenantId");
          statusRequest = StatusRequest.success;
          update();
          Get.offAllNamed(AppRoute.logIn);
        } else {
          Get.defaultDialog(
              title: "Waring", middleText: "${response['error']['message']}");
          statusRequest = StatusRequest.failure;
        }
        update();
      } else {
        Get.defaultDialog(
          title: "Waring",
          middleText: "Tenan Company Name invalid",
        );
        statusRequest = StatusRequest.failure;
        update();
      }
      update();
    } else {}
  }

  @override
  void dispose() {
    tenantname.dispose();
    firsname.dispose();
    lastname.dispose();
    super.dispose();
  }
}
