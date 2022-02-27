class ServiceResponseModel {
  List<dynamic> data;

  ServiceResponseModel(this.data);

  static ServiceResponseModel fromMap(List<dynamic> list) =>
      ServiceResponseModel(list);
}

class ServicesModel {
  int id;
  String name;
  String description;

  ServicesModel(this.id, this.name, this.description);

  static ServicesModel fromMap(Map<String, dynamic> map) {
    return ServicesModel(map["id"], map["name"], map["description"]);
  }
}
