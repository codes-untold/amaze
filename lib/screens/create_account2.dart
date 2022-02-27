import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:temple/components/category_select.dart';
import 'package:temple/components/custom_block.dart';
import 'package:temple/components/solid_button.dart';
import 'package:temple/controller/logic_controller.dart';
import 'package:temple/models/categories.dart';
import 'package:temple/utils/constants.dart';
import 'package:temple/utils/services.dart';

import 'create_account3.dart';

class AccountCreate2 extends StatefulWidget {
  AccountCreate2({Key? key}) : super(key: key);

  @override
  State<AccountCreate2> createState() => _AccountCreate2State();
}

class _AccountCreate2State extends State<AccountCreate2> {
  List<CategoryModel> selectedCategories = [];

  String selectedCategory = "";

  @override
  Widget build(BuildContext context) {
    return Consumer<AppController>(
      builder: (context, appController, child) {
        return ModalProgressHUD(
          inAsyncCall: appController.isScreenBusy,
          child: Scaffold(
            backgroundColor: const Color(0xffE5E5E5),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomBlock(
                          "badge",
                          4,
                          6,
                          "Perfect ${appController.userInfo!.firstName} 😎️,",
                          "Getting closer to meeting your fans",
                          "Please select a maximum of 5 secondary celebrity category that your fans can use to identify you"),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            Wrap(
                              spacing: 5,
                              runSpacing: 10,
                              direction: Axis.horizontal,
                              children: List.generate(
                                  appController.categoryList.length, (index) {
                                return GestureDetector(
                                  onTap: () {
                                    if (selectedCategories.contains(
                                        appController.categoryList[index])) {
                                      setState(() {
                                        selectedCategories.removeWhere(
                                            (element) =>
                                                element ==
                                                appController
                                                    .categoryList[index]);
                                        print(selectedCategories);
                                      });
                                    } else {
                                      setState(() {
                                        if (selectedCategories.length == 5) {
                                        } else {
                                          selectedCategories.add(appController
                                              .categoryList[index]);
                                        }
                                      });
                                    }
                                  },
                                  child: CategorySelect(
                                      selectedCategories.contains(
                                              appController.categoryList[index])
                                          ? true
                                          : false,
                                      appController.categoryList[index].name),
                                );
                              }),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: SolidButton(() {
                          if (selectedCategories.isEmpty) {
                            Services().showToast("select category");
                          } else {
                            print(appController.updateData);

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AccountCreate3()),
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
            ),
          ),
        );
      },
    );
  }

  Future<void> addCategories() async {}
}
