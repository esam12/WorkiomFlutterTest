
import 'package:get/get.dart';
import 'package:workiomtest/core/class/crud.dart';

class MyBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}
