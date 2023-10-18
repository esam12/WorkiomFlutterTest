import 'package:workiomtest/core/class/crud.dart';
import 'package:workiomtest/linkapi.dart';

class RegisterTenant {
  late Crud crud;

  RegisterTenant(this.crud);

  postData(
      String emailAddress,
      String adminFirstName,
      String adminLastName,
      String adminPassword,
      String editionId,
      String name,
      String tenancyName) async {
    var response = await crud.postData(LinkApi.RegisterTenant, {
      "adminEmailAddress": emailAddress,
      "adminFirstName": adminFirstName,
      "adminLastName": adminLastName,
      "adminPassword": adminPassword,
      "captchaResponse": null,
      "editionId": editionId,
      "name": name,
      "tenancyName": tenancyName
    });
    return response.fold((l) => l, (r) => r);
  }
}
