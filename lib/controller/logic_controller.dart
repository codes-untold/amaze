import 'package:flutter/material.dart';
import 'package:temple/models/categories.dart';
import 'package:temple/models/signup_model.dart';

class AppController extends ChangeNotifier {
  CategoryModel? primaryCategory;
  bool isScreenBusy = false;
  SignUpResponseModel? userInfo;

  List passwordFieldChecks = [];
  List<CategoryModel> categoryList = [];
  Map<String, dynamic> updateData = {};

  void updatePrimaryCategory(CategoryModel value) {
    primaryCategory = value;
    notifyListeners();
  }

  void addPasswordCheck(String value) {
    if (!passwordFieldChecks.contains(value)) {
      passwordFieldChecks.add(value);
    }
    print(passwordFieldChecks);
    notifyListeners();
  }

  void removePasswordCheck(String value) {
    passwordFieldChecks.removeWhere((e) => e == value);
    print(passwordFieldChecks);
    notifyListeners();
  }

  void busyScreen() {
    isScreenBusy = true;
    notifyListeners();
  }

  void idleScreen() {
    isScreenBusy = false;
    notifyListeners();
  }
}
