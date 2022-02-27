class SignUpRequestModel {
  String firstName;
  String lastName;
  String email;
  String phoneNumber;
  String companyName;
  int primaryCelebrityCategory;
  String celebrityAKA;
  String jobTitle;
  int userType;
  String location;
  String password;

  SignUpRequestModel(
      this.firstName,
      this.lastName,
      this.phoneNumber,
      this.email,
      this.celebrityAKA,
      this.companyName,
      this.jobTitle,
      this.location,
      this.password,
      this.primaryCelebrityCategory,
      this.userType);

  static SignUpRequestModel? fromMap(Map<String, dynamic> map) =>
      SignUpRequestModel(
          map["firstName"],
          map["lastName"],
          map["phoneNumber"],
          map["email"],
          map["celebrityAKA"],
          map["companyName"],
          map["jobTitle"],
          map["location"],
          map["password"],
          map["primaryCelebrityCategory"],
          map["userType"]);

  Map toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phoneNumber": phoneNumber,
        "password": password,
        "jobTitle": jobTitle,
        "location": location,
        "companyName": companyName,
        "celebrityAka": celebrityAKA,
        "primaryCelebrityCategory": primaryCelebrityCategory,
        "userType": userType
      };
}

class SignUpResponseModel {
  String id;
  String firstName;
  String lastName;
  String email;
  String phoneNumber;

  int userType;
  String location;

  SignUpResponseModel(this.id, this.firstName, this.lastName, this.phoneNumber,
      this.email, this.location, this.userType);

  static SignUpResponseModel fromMap(Map<String, dynamic> map) =>
      SignUpResponseModel(
          map["user"]["id"],
          map["user"]["firstName"],
          map["user"]["lastName"],
          map["user"]["phoneNumber"],
          map["user"]["email"],
          map["user"]["location"],
          map["user"]["userType"]);

  Map toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "emailAddress": email,
        "phoneNumber": phoneNumber,
        "location": location,
        "userType": userType
      };
}
