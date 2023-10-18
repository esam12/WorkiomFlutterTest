

import 'package:workiomtest/core/class/crud.dart';
import 'package:workiomtest/linkapi.dart';

class SignUpData {
  late Crud crud;

  SignUpData(this.crud);

  postData(String email, String password) async {
    var response = await crud.postData(LinkApi.GetCurrentLoginInformations, {
      "email": email,
      "password": password,
      
    });
    return response.fold((l) => l, (r) => r);
  }
}
