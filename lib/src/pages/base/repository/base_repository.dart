import 'package:Provision/src/pages/auth/controller/auth_controller.dart';
import 'package:Provision/src/services/http_manager.dart';
import 'package:get/get.dart';
import '../../../constants/end_points.dart';

class BaseRepository {
  HttpManager _httpManager = HttpManager();
  final authController = Get.find<AuthController>();

  Future<bool> sendLocationCurrent(
      {required String location,
      required List<Map<String, dynamic>> route}) async {
    final result = await _httpManager.resRequest(
        urlEndPoint:
            Endpoints.geoLocation + authController.user.employeeId.toString(),
        method: HttpMethods.post,
        body: {"name": location, "route": route});
    //print(result);
    if (result["status"] == 201) {
      return true;
    } else {
      return false;
    }
  }

}
