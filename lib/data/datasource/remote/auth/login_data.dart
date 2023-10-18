import 'package:workiomtest/core/class/crud.dart';
import 'package:workiomtest/linkapi.dart';

class LoginData {
  late Crud crud;

  LoginData(this.crud);

  postData(
      String password, String tenantName, String userNameOrEmailAddress) async {
    var response = await crud.postData(LinkApi.Authenticate, {
      "ianaTimeZone": "Europe/Istanbul",
      "password": password,
      "rememberClient": false,
      "returnUrl": null,
      "singleSignIn": false,
      "tenantName": tenantName,
      "userNameOrEmailAddress": userNameOrEmailAddress,
    });

    return response.fold((l) => l, (r) => r);
  }
}
