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

import 'create_account5.dart';

class AccountCreate4 extends StatefulWidget {
  AccountCreate4({Key? key}) : super(key: key);

  @override
  State<AccountCreate4> createState() => _AccountCreate4State();
}

class _AccountCreate4State extends State<AccountCreate4> {
  bool serviceSelected = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<AppController>(builder: (context, appController, child) {
      return Scaffold(
        backgroundColor: const Color(0xffE5E5E5),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          CustomBlock(
                              "gift",
                              6,
                              4,
                              "Hooray ${appController.userInfo!.firstName} 🎉️,",
                              "We are almost there!!",
                              "Please select the service(s) you choose to offer on Amaze"),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: serviceSelected
                                          ? const Color(0xffFEF2F9)
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                          color: serviceSelected
                                              ? const Color(0xffE6007e)
                                              : const Color(0xffE3E0E0))),
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            "Video Shoutout - Fans",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                color: serviceSelected
                                                    ? const Color(0xffaA4866)
                                                    : const Color(0xffA5a3B2)),
                                          ),
                                          Radio(
                                              activeColor:
                                                  const Color(0xffE6007e),
                                              value: serviceSelected,
                                              toggleable: true,
                                              groupValue: true,
                                              onChanged: (bool? value) {
                                                if (serviceSelected) {
                                                  setState(() {
                                                    serviceSelected = false;
                                                  });
                                                } else {
                                                  setState(() {
                                                    serviceSelected = true;
                                                  });
                                                }
                                              })
                                        ],
                                      ),
                                      Text(
                                        "Create personalised videos for your"
                                        " fans and leave them Amaze-d.",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: serviceSelected
                                                ? const Color(0xffaA4866)
                                                : const Color(0xffA5a3B2)),
                                      ),
                                    ],
                                  ),
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
                    if (serviceSelected == false) {
                      Services().showToast("select service");
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AccountCreate5()),
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
