import 'dart:convert';
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
import 'package:temple/utils/services.dart';
import 'package:http/http.dart' as http;

import 'create_account6.dart';

class AccountCreate5 extends StatefulWidget {
  AccountCreate5({Key? key}) : super(key: key);

  @override
  State<AccountCreate5> createState() => _AccountCreate5State();
}

class _AccountCreate5State extends State<AccountCreate5> {
  TextEditingController controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Consumer<AppController>(builder: (context, appController, child) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xffE5E5E5),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomBlock(
                              "notes",
                              7,
                              3,
                              "Cha-Ching ${appController.userInfo!.firstName} 💵️,",
                              "Time to put a price on it",
                              "Please set a price you’d like your fans to pay for your service"),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    appController.selectedService!.name,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: const Color(0xffE6007e),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Form(
                                  key: _formKey,
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Enter field";
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.number,
                                    controller: controller,
                                    decoration: InputDecoration(
                                        prefixIcon: Container(
                                          child: Image.asset(
                                            "assets/icons/naira.png",
                                            width: 10,
                                            height: 10,
                                          ),
                                        ),
                                        prefixIconConstraints:
                                            const BoxConstraints.tightFor(
                                                width: 20),
                                        hintText: "Enter preferred amount",
                                        isCollapsed: true,
                                        errorBorder: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8)),
                                          borderSide: BorderSide(
                                              color: Palette.errorField,
                                              width: 1),
                                        ),
                                        isDense: true,
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                vertical: 15, horizontal: 10),
                                        border: const OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8)),
                                          borderSide: BorderSide(
                                              color: Palette.textFieldBorder,
                                              width: 1),
                                        )),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: double.infinity,
                                  child: Row(
                                    children: const [
                                      Icon(Icons.info),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Text.rich(
                                          TextSpan(
                                            text:
                                                'We recommend a minimum price of ',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Palette.gray2,
                                            ),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: '₦100,000',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: Color(0xff299B01),
                                                  height: 1.5,
                                                ),
                                              ),
                                              TextSpan(
                                                text: ' and maximum price of',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: Palette.gray2,
                                                  height: 1.5,
                                                ),
                                              ),
                                              //for video shoutout - fans
                                              TextSpan(
                                                text: ' ₦1,000,000 .',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color: Color(0xff299B01),
                                                    height: 1.5),
                                              ),
                                              TextSpan(
                                                text:
                                                    'for video shoutout - fans',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w400,
                                                    color: Palette.gray2,
                                                    height: 1.5),
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: const Color(0x1A76768D)),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SolidButton(() {
                    if (_formKey.currentState!.validate()) {
                      appController.updateData["serviceInformation"][0]
                          ["fanPrice"] = controller.text;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AccountCreate6()),
                      );
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
      );
    });
  }
}
