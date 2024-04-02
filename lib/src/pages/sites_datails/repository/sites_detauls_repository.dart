
import 'package:geolocator/geolocator.dart';

import '../../../constants/end_points.dart';
import '../../../services/http_manager.dart';

class SitesDetaulsRepository {
  HttpManager _httpManager = HttpManager();

  Future<bool> updateLocation(
      {required String costCenter,
      required String clientCode,
      required Position? currentPosition}) async {
    final result = await _httpManager.resRequest(
        urlEndPoint: Endpoints.updateLocatiom + "$costCenter/" + "$clientCode",
        method: HttpMethods.put,
        body: {
          "lat": currentPosition!.latitude,
          "lng": currentPosition.longitude,
        });

    if (result["status"] == 200) {
      return true;
    } else {
      return false;
    }
  }
}