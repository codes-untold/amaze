import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temple/components/category_select.dart';
import 'package:temple/components/custom_block.dart';
import 'package:temple/components/solid_button.dart';
import 'package:temple/controller/logic_controller.dart';
import 'package:temple/utils/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:temple/utils/services.dart';

import 'create_account4.dart';

class AccountCreate3 extends StatefulWidget {
  AccountCreate3({Key? key}) : super(key: key);

  @override
  State<AccountCreate3> createState() => _AccountCreate3State();
}

class _AccountCreate3State extends State<AccountCreate3> {
  File? _imageFile;
  final _picker = ImagePicker();

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
                              "privacy",
                              5,
                              5,
                              "Smile ${appController.userInfo!.firstName} 📸️,",
                              "It’s time to take a picture",
                              "Please upload or take a picture for your fans to easily recognize and book an experience"),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    openImagePicker(context);
                                  },
                                  child: _imageFile == null
                                      ? Stack(
                                          alignment: Alignment.bottomRight,
                                          children: [
                                            Image.asset(
                                              "assets/icons/image_add.png",
                                              width: 150,
                                            ),
                                            const CircleAvatar(
                                              radius: 20,
                                              backgroundColor:
                                                  Color(0xff1195ff),
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                            )
                                          ],
                                        )
                                      : CircleAvatar(
                                          radius: 90,
                                          backgroundImage:
                                              FileImage(_imageFile!),
                                        ),
                                ),
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
                    if (_imageFile == null) {
                      Services().showToast("upload picture");
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AccountCreate4()),
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

  void openImagePicker(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text(
          "Choose an option",
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
        actions: <Widget>[
          CupertinoActionSheetAction(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.camera),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "Camera",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                )
              ],
            ),
            onPressed: () async {
              setImageFromCamera();
            },
          ),
          CupertinoActionSheetAction(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.image),
                SizedBox(
                  width: 15,
                ),
                Text(
                  "Gallery",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                )
              ],
            ),
            onPressed: () async {
              setImageFromGallery();
            },
          ),
        ],
      ),
    );
  }

  void setImageFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    } else {}
  }

  void setImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    } else {}
  }
}
