 import 'package:get/get.dart';

import '../controller/sites_controller.dart';

class SitesDatailsBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(SitesController());
  }

}