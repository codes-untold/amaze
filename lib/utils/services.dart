import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:temple/utils/constants.dart';

class Services {
  void showToast(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Palette.textBlue,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
