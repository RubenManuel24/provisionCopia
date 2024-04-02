import 'package:Provision/src/pages/history_detalhe/controller/history_detalhes_controller.dart';
import 'package:get/get.dart';

class HistoryDetalheBinding extends Bindings {
  @override
  void dependencies() {
    Get.put( HistoryDetalhesController());
  }  
}