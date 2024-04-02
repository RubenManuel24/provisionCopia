class UserModel {
  var id;
  var name;
  var email;
  var address;
  var phoneNumber;
  var password;
  var employeeId;
  var mecCoordinator;
  var type;
  var createdAt;
  var updatedAt;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.address,
    this.phoneNumber,
    this.password,
    this.employeeId,
    this.mecCoordinator,
    this.type,
    this.createdAt,
    this.updatedAt,
  });

  factory UserModel.fromMap(Map<String?, dynamic> map) {
    return UserModel(
      id: map["_id"],
      name: map["name"],
      email: map["email"],
      address: map["address"],
      phoneNumber: map["phoneNumber"],
      password: map["password"],
      employeeId: map["employeeId"],
      type: map["type"],
      createdAt: DateTime.parse(map["createdAt"]),
      updatedAt: DateTime.parse(map["updatedAt"]),
      mecCoordinator: map["mecCoordinator"],
    );
  }

  Map<String?, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "address": address,
      "phoneNumber": phoneNumber,
      "password": password,
      "employeeId": employeeId,
      "type": type,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
      "mecCoordinator": mecCoordinator
    };
  }
}
