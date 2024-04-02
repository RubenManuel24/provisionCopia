class CompanySitesModels {
  String id;
  String name;
  DateTime createdAt;
  DateTime updatedAt;
  String supervisorCode;
  String clientCode;
  String address;
  List workers;
  var latitude;
  var longitude;
  String costCenter;
  String ctClient;
  CompanySitesModels({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.supervisorCode,
    required this.clientCode,
    required this.address,
    required this.workers,
    required this.latitude,
    required this.longitude,
    required this.costCenter,
    required this.ctClient,
  });

  factory CompanySitesModels.fromMap(Map<String, dynamic> map) {
    return CompanySitesModels(
      id: map["_id"],
      name: map["name"],
      createdAt: DateTime.parse(map["createdAt"]),
      updatedAt: DateTime.parse(map["updatedAt"]),
      supervisorCode: map["supervisorCode"],
      clientCode: map["clientCode"],
      address: map["address"],
      workers: map["workers"] ?? " ",
      costCenter: map["costCenter"],
      ctClient: map["ctClient"],
      latitude: map["location"]["lat"] ?? "401.0",
      longitude: map["location"]["lng"] ?? "401.0",
    );
  }

  Map<String, dynamic> toMap(){
    return {
      "id": id,
      "name": name,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
      "supervisorCode": supervisorCode,
      "clientCode": clientCode,
      "address": address,
      "workers": workers,
    };
  }
}
