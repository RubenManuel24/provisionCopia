class LocationModel {

  double? latitude;
  double? longitude;
  DateTime? time;

  LocationModel({
     this.latitude,
     this.longitude,
     this.time,
  });

   factory LocationModel.fromMap(Map<String, dynamic> map) {
    return LocationModel(
      latitude: map["latitude"],
      longitude: map["longitude"],
      time: map["time"],
    );
  }

  Map<String, dynamic> toMap(){
    return {
       "latitude": latitude,
       "longitude": longitude,
       "time": time,
    };
   }


}
