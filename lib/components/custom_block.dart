import 'package:flutter/material.dart';
import 'package:temple/utils/constants.dart';

class CustomBlock extends StatelessWidget {
  CustomBlock(
      this.icon, this.flex1, this.flex2, this.text1, this.text2, this.text3,
      {Key? key})
      : super(key: key);

  String icon;
  int flex1;
  int flex2;
  String text1;
  String text2;
  String text3;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              "assets/icons/icon_back_button.png",
              width: 40,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Expanded(
              flex: flex1,
              child: Container(
                color: Palette.errorField,
                height: 2,
              ),
            ),
            Expanded(
              flex: flex2,
              child: Container(
                color: Palette.iconBg,
                height: 2,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Palette.iconBg,
                child: Image.asset(
                  "assets/icons/$icon.png",
                  width: 20,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                text1,
                style: const TextStyle(
                    fontWeight: FontWeight.w700, fontSize: 17.5),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                text2,
                style: const TextStyle(
                    fontWeight: FontWeight.w700, fontSize: 17.5),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                text3,
                style: const TextStyle(
                    fontWeight: FontWeight.w500, fontSize: 13.5),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
