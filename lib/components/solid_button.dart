import 'package:flutter/material.dart';

class SolidButton extends StatelessWidget {
  SolidButton(this.callback, {Key? key}) : super(key: key);

  VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        width: double.infinity,
        height: 60,
        child: const Center(
            child: Text(
          "Save and Continue",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        )),
        decoration: const BoxDecoration(
            color: Color(0xff140432),
            borderRadius: BorderRadius.all(Radius.circular(32))),
      ),
    );
  }
}
