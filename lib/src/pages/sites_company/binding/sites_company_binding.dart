import 'package:get/get.dart';

import '../controller/company_sites_controller.dart';

class SitesCompanyBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(SitesCompanyController());
  }

}