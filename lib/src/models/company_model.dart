
class CompanyModel {
  String id;
  String name;
  DateTime createdAt;
  DateTime updatedAt;
  String deletedAt;
  String photo;
  String clientCode;
  CompanyModel({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.photo,
    required this.clientCode,
  });

  factory CompanyModel.fromMap(Map<String, dynamic> map) {
    return CompanyModel(
        id: map["_id"],
        name: map["name"],
        createdAt: DateTime.parse(map["createdAt"]),
        updatedAt: DateTime.parse(map["updatedAt"]),
        deletedAt: map["deletedAt"] ?? " ",
        photo: map["photo"] ?? " ",
     clientCode: map["clientCode"]

    );
  }

  Map<String, dynamic> toMap(){
    return {
      "id": id,
      "name": name,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
      "deletedAt": deletedAt,
      "photo": photo,
      "clientCode": clientCode
    };
  }

}
