import 'package:get/get.dart';
import '../controller/navigation_controller.dart';
class NavigationTabBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => NavigationController());
  }

}