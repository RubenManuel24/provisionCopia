class EmployeeModel {
  String name;
  String employeeNumber;
  String state;
  String obs;
  EmployeeModel({
    required this.name,
    required this.employeeNumber,
    required this.state,
    required this.obs
  });

    factory EmployeeModel.fromMap(Map<String, dynamic> map){
    return EmployeeModel(
      name: map["name"] ?? '',
      employeeNumber: map["employeeNumber"] ?? '',
      state: map["state"] ?? '' ,
      obs: map["obs"] ?? ""
      );
  }

   Map<String, dynamic> toJson() {
    return {
      'name': name,
      'employeeNumber': employeeNumber,
      'state': state,
      'obs': obs
    };
  }

}
