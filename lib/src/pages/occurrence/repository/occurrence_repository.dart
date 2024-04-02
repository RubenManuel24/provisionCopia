import 'package:Provision/src/pages/auth/controller/auth_controller.dart';
import 'package:get/get.dart';

import '../../../constants/end_points.dart';
import '../../../services/http_manager.dart';

class OccurenceRepository {
   HttpManager _httpManager = HttpManager();
   AuthController authController = Get.find<AuthController>();

   Future<bool> sendOccurence({required String name, required String details, required int priority, required double latitude, required double longitude, required String consterCenter}) async {
    final result = await _httpManager.resRequest(
      urlEndPoint: Endpoints.occurence+authController.user.employeeId,
      method: HttpMethods.post,
      body: {
        "name": name,
        "details": details,
        "priority": priority,
        "geolocation": {
          "latitude": latitude,
          "longitude": longitude,
        },
        "costCenter": consterCenter
      }
    );
    if (result["status"] == 201) {
      return true;
    } else {
      print('jkhjkhuityuygjhg $result');
      return false;
    }
  }
}