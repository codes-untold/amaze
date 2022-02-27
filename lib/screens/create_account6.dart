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

import 'create_account7.dart';

class AccountCreate6 extends StatefulWidget {
  const AccountCreate6({Key? key}) : super(key: key);

  @override
  _AccountCreate6State createState() => _AccountCreate6State();
}

class _AccountCreate6State extends State<AccountCreate6> {
  TextEditingController controller = TextEditingController();
  final formKeyy = GlobalKey<FormState>();

  static const menuItems = <String>[
    "Guaranty Trust Bank",
  ];

  late final List<PopupMenuItem<String>> _popUptimeItems;
  String? selectedBankName;
  bool isLoading = false;
  var userAccount;

  @override
  void initState() {
    super.initState();
    _popUptimeItems = menuItems
        .map((String value) => PopupMenuItem(
              child: Text(value),
              value: value,
            ))
        .toList();
  }

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
                              "rocket",
                              8,
                              2,
                              "Almost ${appController.userInfo!.firstName} ⚙️️,",
                              "Set up your withdrawal account",
                              "Please set up your preferred withdrawal account and we’ll direct your funds to it"),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                userAccount == null
                                    ? Column(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(16),
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                border: Border.all(
                                                    color: Palette.gray2)),
                                            child: PopupMenuButton(
                                                onSelected: (String newValue) {
                                                  setState(() {
                                                    selectedBankName = newValue;
                                                  });
                                                },
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        selectedBankName ??
                                                            "Please select bank",
                                                        style: const TextStyle(
                                                            color:
                                                                Palette.gray2),
                                                      ),
                                                    ),
                                                    const Icon(
                                                        Icons.arrow_drop_down,
                                                        color: Palette.gray2)
                                                  ],
                                                ),
                                                itemBuilder:
                                                    (BuildContext context) =>
                                                        _popUptimeItems),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Form(
                                            key: formKeyy,
                                            child: TextFormField(
                                              onChanged: (value) {
                                                setState(() {
                                                  isLoading = true;
                                                });

                                                Future.delayed(
                                                    const Duration(seconds: 2),
                                                    () {
                                                  setState(() {
                                                    if (selectedBankName ==
                                                        null) {
                                                      Services().showToast(
                                                          "select bank");
                                                      isLoading = false;
                                                      return;
                                                    }
                                                    isLoading = false;
                                                    userAccount = "fetched";
                                                  });
                                                });
                                              },
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return "Enter field";
                                                }
                                                return null;
                                              },
                                              keyboardType: TextInputType.phone,
                                              controller: controller,
                                              decoration: const InputDecoration(
                                                  hintText:
                                                      "Enter Account number",
                                                  isCollapsed: true,
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(8)),
                                                    borderSide: BorderSide(
                                                        color:
                                                            Palette.errorField,
                                                        width: 1),
                                                  ),
                                                  isDense: true,
                                                  contentPadding:
                                                      EdgeInsets.symmetric(
                                                          vertical: 20,
                                                          horizontal: 10),
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(8)),
                                                    borderSide: BorderSide(
                                                        color: Palette
                                                            .textFieldBorder,
                                                        width: 1),
                                                  )),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Center(
                                            child: Visibility(
                                                visible: isLoading,
                                                child:
                                                    const CupertinoActivityIndicator()),
                                          ),
                                        ],
                                      )
                                    : Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            color: const Color(0xffF8F7FB)),
                                        padding: const EdgeInsets.all(16),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: const [
                                                Text(
                                                  "Guaranty Trust Bank",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Color(0xff1d1a40)),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  "Ademola Gbadamosi",
                                                  style: TextStyle(
                                                      color: Palette.gray2),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  "23456 - *****",
                                                  style: TextStyle(
                                                      color: Palette.gray2),
                                                ),
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  userAccount = null;
                                                });
                                              },
                                              child: const CircleAvatar(
                                                radius: 15,
                                                backgroundColor: Colors.white,
                                                child: Icon(
                                                  Icons.delete_outline,
                                                  size: 15,
                                                  color: Palette.gray2,
                                                ),
                                              ),
                                            )
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
                    if (selectedBankName != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AccountCreate7()),
                      );
                    } else {
                      Services().showToast("Enter your bank details");
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
