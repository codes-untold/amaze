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
import 'package:temple/models/bank_model.dart';
import 'package:temple/utils/constants.dart';
import 'package:http/http.dart' as http;
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

  List<BankModel> menuItems = [];
  String? bankCode;
  String? accountName;
  String? accountNumber;

  late final List<PopupMenuItem<String>> _popUptimeItems;
  String? selectedBankName;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    AppController controller = Provider.of(context, listen: false);

    _popUptimeItems = controller.banks
        .map((BankModel value) => PopupMenuItem(
              onTap: () {
                bankCode = value.code;
              },
              child: Text(value.name),
              value: value.name,
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
                                accountName == null
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
                                              onSaved: (value) {
                                                print("ffff");
                                              },
                                              onChanged: (value) {
                                                if (bankCode == null) {
                                                  Services()
                                                      .showToast("select bank");
                                                } else {
                                                  if (value.length == 10) {
                                                    verifyAccount()
                                                        .then((value) {})
                                                        .onError((error,
                                                            stackTrace) {});
                                                  }
                                                }
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
                                              children: [
                                                Text(
                                                  selectedBankName!,
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Color(0xff1d1a40)),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  accountName!,
                                                  style: const TextStyle(
                                                      color: Palette.gray2),
                                                ),
                                                const SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  "${accountNumber!.substring(0, 4)}- *****",
                                                  style: const TextStyle(
                                                      color: Palette.gray2),
                                                ),
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  accountName = null;
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
                    if (accountName != null) {
                      appController.updateData["bankDetails"] = {};
                      appController.updateData["bankDetails"]["bankCode"] =
                          bankCode;
                      appController.updateData["bankDetails"]["accountNumber"] =
                          accountNumber;
                      appController.updateData["bankDetails"]["accountName"] =
                          accountName;
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

  Future<void> verifyAccount() async {
    var body = {"account_number": controller.text, "account_bank": bankCode};
    var url = Uri.parse(
        "https://api.paystack.co/bank/resolve?account_number=${controller.text}&bank_code=$bankCode");
    setState(() {
      isLoading = true;
    });
    http.get(url, headers: {
      'Authorization': 'Bearer sk_live_69fa43ee7d62e702f40fbad9c7a90baa53a4374a'
    }).then((value) {
      print(value.body);
      setState(() {
        isLoading = false;
      });
      var bankData = jsonDecode(value.body);
      if (bankData["status"] == false) {
        Services().showToast("could not resolve account name");
      } else {
        setState(() {
          accountName = bankData["data"]["account_name"];
          accountNumber = bankData["data"]["account_number"];
        });
      }
    }).onError((error, stackTrace) {
      setState(() {
        isLoading = false;
      });
    });

    // print(response.body);
  }
}
