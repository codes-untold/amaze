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

import 'create_account8.dart';

class AccountCreate7 extends StatefulWidget {
  AccountCreate7({Key? key}) : super(key: key);

  @override
  State<AccountCreate7> createState() => _AccountCreate7State();
}

class _AccountCreate7State extends State<AccountCreate7> {
  File? file;
  String? fileName;
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
                              "document",
                              9,
                              1,
                              "Finally ${appController.userInfo!.firstName} 🤙️️,",
                              "Additional information required",
                              "Please upload necessary additional information to avoid duplicacy of your identity"),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: const [
                                    Text(
                                      "Identification Document",
                                      style: TextStyle(color: Palette.gray2),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Icon(Icons.info, color: Palette.gray2)
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      file != null
                                          ? Expanded(
                                              child: Container(
                                                child: Text(fileName!),
                                              ),
                                            )
                                          : Container(),
                                      GestureDetector(
                                        onTap: () async {
                                          FilePickerResult? result =
                                              await FilePicker.platform
                                                  .pickFiles(
                                            type: FileType.custom,
                                            allowedExtensions: [
                                              'docx',
                                              'pdf',
                                              'doc',
                                              "xls",
                                              "xlxs"
                                            ],
                                          );

                                          if (result != null) {
                                            file =
                                                File(result.files.single.path!);

                                            List list = file!.path.split("/");
                                            setState(() {
                                              fileName = list[list.length - 1];
                                            });
                                          }
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color: const Color(0xff299B01)),
                                          child: const Text(
                                            "Upload",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: Palette.gray2)),
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
                    if (file != null) {
                      appController.updateData["identificationDocument"] =
                          "testFileUrl";
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AccountCreate8()));
                    } else {
                      Services().showToast("upload file");
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
