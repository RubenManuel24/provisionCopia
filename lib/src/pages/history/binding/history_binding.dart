import 'package:Provision/src/pages/history/controller/history_controller.dart';
import 'package:get/get.dart';

class HistoryBinding extends Bindings{
  @override
  void dependencies() {
    Get.put( HistoryController());
  }

}