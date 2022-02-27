import 'package:flutter/material.dart';

class CategorySelect extends StatelessWidget {
  CategorySelect(this.isSelected, this.CategoryName, {Key? key})
      : super(key: key);

  bool isSelected;
  String CategoryName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Center(
        child: Text(
          CategoryName,
          style: TextStyle(
              fontSize: 12,
              color: isSelected
                  ? const Color(0xffe6007e)
                  : const Color(0xff7676AD)),
        ),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          border: Border.all(
              color: isSelected
                  ? const Color(0xffe6007e)
                  : const Color(0xff7676AD)),
          color:
              isSelected ? const Color(0x1Ae6007e) : const Color(0xfff6f7f7)),
    );
  }
}
