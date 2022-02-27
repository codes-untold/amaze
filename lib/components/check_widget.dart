import 'package:flutter/material.dart';
import 'package:temple/utils/constants.dart';

class CheckWidget extends StatelessWidget {
  CheckWidget(this.checkName, {Key? key}) : super(key: key);

  String checkName;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      padding: const EdgeInsets.all(4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.check,
            color: Palette.selectGreen,
            size: 15,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            checkName,
            style: const TextStyle(color: Palette.selectGreen, fontSize: 12),
          )
        ],
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Color(0x1A299B01),
      ),
    );
  }
}
