import 'package:Provision/src/pages/occurrence/controller/occurrence_controller.dart';
import 'package:get/get.dart';

class OcurrenceBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(OccurenceController());
  }
}