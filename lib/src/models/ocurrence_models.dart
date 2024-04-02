class OcurrenceModels {
  String name;
  String details;
  int priority;
  double latitude;
  double longitude;
  String costCenter;
  OcurrenceModels({
    required this.name,
    required this.details,
    required this.priority,
    required this.latitude,
    required this.longitude,
    required this.costCenter
  });

  factory OcurrenceModels.fromMap(Map<String, dynamic> map){
    return OcurrenceModels(
      name: map["name"],
      details: map["details"],
      priority: map["priority"],
      latitude: map["geolocation"]["latitude"],
      longitude: map["geolocation"]["longitude"],
      costCenter: map["costCenter"]
    );
  }

  Map<String, dynamic> toJson() {
    return {
     'name': name,
     'details': details,
     'priority': priority,
     'latitude': latitude,
     'longitude': longitude,
    };
  }
}
