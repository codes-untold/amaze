import 'package:flutter/material.dart';
import 'package:temple/components/category_sheet.dart';
import 'package:temple/utils/constants.dart';

class CategoryBox extends StatelessWidget {
  CategoryBox(this.categoryName, {Key? key}) : super(key: key);

  String categoryName;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 8),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              border: Border.all(color: Palette.textFieldBorder)),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(categoryName),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (ctx) {
                        return CategorySheet();
                      },
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20))),
                      isScrollControlled: true);
                },
                child: const CircleAvatar(
                  backgroundColor: Palette.selectGreen,
                  radius: 15,
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 16),
          color: Palette.bgColor,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: const Text(
            "Primary Celebrity Category",
            style: TextStyle(color: Palette.fieldText),
          ),
        )
      ],
    );
  }
}
