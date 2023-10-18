import 'package:workiomtest/core/class/crud.dart';
import 'package:workiomtest/linkapi.dart';

class GetEditionsForSelect {
  late Crud crud;

  GetEditionsForSelect(this.crud);

  getData(String tenancyName) async {
    var response = await crud.getData(LinkApi.GetEditionsForSelect);
    return response.fold((l) => l, (r) => r);
  }
}
