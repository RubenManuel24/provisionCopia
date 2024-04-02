import "package:get/get.dart";
import "../controller/supervision_controller.dart";

class SupervisionBindig extends Bindings{
  @override
  void dependencies() {
   Get.put(SupervisionController());
  }
}