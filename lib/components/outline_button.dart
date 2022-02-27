import 'package:flutter/material.dart';

class OutLineButton extends StatelessWidget {
  OutLineButton(this.borderColor, this.buttonText, {Key? key})
      : super(key: key);

  Color borderColor;
  Text buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      child: Center(child: buttonText),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: borderColor,
          )),
    );
  }
}
