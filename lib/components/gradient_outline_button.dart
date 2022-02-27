import 'package:flutter/material.dart';
import 'package:temple/utils/constants.dart';

class GradientOutLineButton extends StatelessWidget {
  GradientOutLineButton(this.buttonText, this.callback, {Key? key})
      : super(key: key);

  Text buttonText;
  VoidCallback callback;

  final kGradientBoxDecoration = BoxDecoration(
    gradient: const LinearGradient(
        colors: [Palette.buttonGradient1, Palette.buttonGradient2]),
    border: Border.all(
        //color: Colors.transparent,
        ),
    borderRadius: BorderRadius.circular(8),
  );

  final kInnerDecoration = BoxDecoration(
    color: const Color(0xff140432),
    // border: Border.all(color: Colors.white),
    borderRadius: BorderRadius.circular(8),
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(1.5),
          child: Container(
            child: Center(child: buttonText),
            decoration: kInnerDecoration,
          ),
        ),
        height: 55.0,
        decoration: kGradientBoxDecoration,
      ),
    );
  }
}
