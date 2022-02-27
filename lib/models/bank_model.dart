class BankResponseModel {
  List<dynamic> data;

  BankResponseModel(this.data);

  static BankResponseModel fromMap(List<dynamic> list) =>
      BankResponseModel(list);
}

class BankModel {
  int id;
  String name;
  String code;

  BankModel(this.id, this.name, this.code);

  static BankModel fromMap(Map<String, dynamic> map) =>
      BankModel(map["id"] ?? 0, map["name"] ?? "", map["code"] ?? "");
}
