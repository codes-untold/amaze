class CategoryModel {
  int id;
  String name;
  String icon;
  int type;

  CategoryModel(
    this.id,
    this.name,
    this.icon,
    this.type,
  );

  static CategoryModel fromMap(Map<String, dynamic> map) => CategoryModel(
      map["id"] ?? 0, map["name"] ?? "", map["icon"] ?? "", map["type"] ?? "");
}

class CategoryResponseModel {
  List<dynamic> data;

  CategoryResponseModel(this.data);

  static CategoryResponseModel? fromList(List<dynamic> data) =>
      CategoryResponseModel(data);
}
