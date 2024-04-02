import 'package:Provision/src/services/util_services.dart';
import 'package:get/get.dart';

import '../repository/occurrence_repository.dart';

class OccurenceController extends GetxController {
  final occurenceRepository = OccurenceRepository();
  UtilServices utilServices = UtilServices();
  RxInt status = 0.obs;

  Future<void> sendOccurence({ required String name, required String details, required int priority, required double lat, required double long, required String consterCenter}) async {

     final result = await occurenceRepository.sendOccurence(
      name: name, 
      details: details, 
      priority: priority, 
      latitude: lat, 
      longitude: long, 
      consterCenter: consterCenter,
      
      );

      if(result){
        utilServices.showToast(text: "Ocorrência enviada com sucesso!");
      }
      else{
         utilServices.showToast(text: "Erro ao enviar a ocorrência!", isError: true);
      }

  }
}
