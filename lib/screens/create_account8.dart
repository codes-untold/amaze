import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temple/components/category_select.dart';
import 'package:temple/components/custom_block.dart';
import 'package:temple/components/solid_button.dart';
import 'package:temple/controller/logic_controller.dart';
import 'package:temple/utils/constants.dart';
import 'package:file_picker/file_picker.dart';
import 'package:temple/utils/services.dart';

import 'create_account9.dart';

class AccountCreate8 extends StatefulWidget {
  AccountCreate8({Key? key}) : super(key: key);

  @override
  State<AccountCreate8> createState() => _AccountCreate8State();
}

class _AccountCreate8State extends State<AccountCreate8> {
  TextEditingController controller = TextEditingController();
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<AppController>(builder: (context, appController, child) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xffE5E5E5),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomBlock(
                              "ticket",
                              10,
                              0,
                              "Done ${appController.userInfo!.firstName} ⛱️️,",
                              "Personal social accounts",
                              "Please enter the url and/or identification for your social media accounts (optional)"),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 40,
                                ),
                                customRow(
                                    controller, null, "Website (Optional)"),
                                const SizedBox(
                                  height: 20,
                                ),
                                Form(
                                  key: _formKey,
                                  child: Column(
                                    children: [
                                      customRow(controller1, "instagram",
                                          "Instagram"),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      customRow(
                                          controller2, "twitter", "Twitter"),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      customRow(
                                          controller3, "facebook", "Facebook"),
                                      const SizedBox(
                                        height: 40,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SolidButton(() {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AccountCreate9()));
                      }
                    }),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget customRow(
      TextEditingController controller, String? icon, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: Palette.gray2),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return "Enter field";
            }
            return null;
          },
          keyboardType: TextInputType.text,
          controller: controller,
          decoration: InputDecoration(
              prefixIcon: Container(
                child: icon != null
                    ? Image.asset(
                        "assets/icons/$icon.png",
                        width: 20,
                        height: 20,
                      )
                    : Container(),
              ),
              prefixIconConstraints: const BoxConstraints.tightFor(width: 40),
              isCollapsed: true,
              errorBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: Palette.errorField, width: 1),
              ),
              isDense: true,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                borderSide:
                    BorderSide(color: Palette.textFieldBorder, width: 1),
              )),
        ),
      ],
    );
  }
}
