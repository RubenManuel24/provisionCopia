import '../../../constants/end_points.dart';
import '../../../models/company_model.dart';
import '../../../services/http_manager.dart';
import '../result/company_model_result.dart';

class CompanyRepository {
  HttpManager _httpManager = HttpManager();

  Future<CompanyModelResult<List<CompanyModel>>> getAllCompany() async {
    final result = await _httpManager.resRequest(
      urlEndPoint: Endpoints.company,
      method: HttpMethods.get,
    );
    if (result != null &&
        result["data"] != null &&
        result["data"]["data"] != null) {
      final List<CompanyModel> company =
          List<Map<String, dynamic>>.from(result["data"]["data"])
              .map((e) => CompanyModel.fromMap(e))
              .toList();
      return CompanyModelResult<List<CompanyModel>>.sucess(company);
    } else {
      return CompanyModelResult.error("Não foi possível recuperar as empresas");
    }
  }
}
