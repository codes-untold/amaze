import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temple/controller/logic_controller.dart';
import 'package:temple/utils/constants.dart';
import 'package:temple/utils/validator.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(this.fieldTag, this.controller, this.type, {Key? key})
      : super(key: key);

  String fieldTag;
  TextEditingController? controller;
  final TextInputType type;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: TextFormField(
            keyboardType: type,
            controller: controller,
            onChanged: (value) {
              AppController controller =
                  Provider.of<AppController>(context, listen: false);

              if (fieldTag == "Password") {
                if (value.isNotEmpty) {
                  if (value.contains(RegExp(r"[a-z]"))) {
                    controller.addPasswordCheck(LOWER_CASE_CHECK);
                  } else {
                    controller.removePasswordCheck(LOWER_CASE_CHECK);
                  }

                  if (value.contains(RegExp(r"[A-Z]"))) {
                    controller.addPasswordCheck(UPPER_CASE_CHECK);
                  } else {
                    controller.removePasswordCheck(UPPER_CASE_CHECK);
                  }

                  if (value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                    controller.addPasswordCheck(SPECIAL_SYMBOL_CHECK);
                  } else {
                    controller.removePasswordCheck(SPECIAL_SYMBOL_CHECK);
                  }
                }
              }
            },
            validator: (value) {
              if (fieldTag == "Password") {
                return TextFieldValidator.validatePassword(value);
              } else {
                return TextFieldValidator.validateField(type, value);
              }
            },
            decoration: const InputDecoration(
                isCollapsed: true,
                //    errorText: "",
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide: BorderSide(color: Palette.errorField, width: 1),
                ),
                isDense: true,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  borderSide:
                      BorderSide(color: Palette.textFieldBorder, width: 1),
                )),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 16),
          color: Palette.bgColor,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            fieldTag,
            style: const TextStyle(color: Palette.fieldText),
          ),
        )
      ],
    );
  }
}
