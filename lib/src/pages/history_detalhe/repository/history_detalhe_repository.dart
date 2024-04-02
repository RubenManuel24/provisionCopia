import '../../../constants/end_points.dart';
import '../../../models/supervision_model.dart';
import '../../../services/http_manager.dart';
import '../result/supervision_model_result.dart';

class HistoryDetalheRepository {
   final HttpManager _httpManager = HttpManager();
  Future<SupervisionModelResult> getAllSupervisor({required String idSupervision }) async {
    final result = await _httpManager.resRequest(
      urlEndPoint: Endpoints.supervision+idSupervision, 
      method: HttpMethods.get
      );

      if(result["status"] == 200){

        final SuperVisionModel supervisionModel = SuperVisionModel.fromMap(result["data"]);

        return SupervisionModelResult.sucess(supervisionModel);
        
      }
      else{
          return SupervisionModelResult.error("Erro ao recuper os históricos");
      }

   }
}