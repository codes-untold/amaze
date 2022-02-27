class ProfileModel {
  String id;

  ProfileModel(
    this.id,
  );

  static ProfileModel fromMap(Map<String, dynamic> map) => ProfileModel(
        map["id"],
      );
}
