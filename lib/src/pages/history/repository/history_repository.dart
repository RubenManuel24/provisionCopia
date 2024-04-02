import 'package:Provision/src/models/history_models.dart';
import 'package:Provision/src/pages/history/result/history_model_result.dart';
import '../../../constants/end_points.dart';
import '../../../services/http_manager.dart';

class HistoryRepository {
  final HttpManager _httpManager = HttpManager();

  Future<HistoryModelResult<List<HistoryModels>>>  getAllHistory() async{
    final result = await _httpManager.resRequest(
      urlEndPoint: Endpoints.history, 
      method: HttpMethods.get
      );

      if (result != null && result["data"] != null && result["data"]["data"] != null) {
      final List<HistoryModels> listHistory = List<Map<String, dynamic>>.from(result["data"]["data"]).map((e) => HistoryModels.fromMap(e)).toList();

      return HistoryModelResult<List<HistoryModels>>.sucess(listHistory);
    } else {
      return HistoryModelResult.error("Não foi possível recuperar os históricos");
    }

   }

   
}