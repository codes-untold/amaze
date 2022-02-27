import 'dart:collection';
import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:temple/components/category_select.dart';
import 'package:temple/components/solid_button.dart';
import 'package:temple/controller/logic_controller.dart';
import 'package:temple/models/bank_model.dart';
import 'package:temple/models/categories.dart';
import 'package:temple/models/services_model.dart';
import 'package:temple/network/api_routes.dart';
import 'package:temple/network/api_service.dart';
import 'package:temple/utils/constants.dart';
import 'package:http/http.dart' as http;

class CategorySheet extends StatefulWidget {
  CategorySheet({Key? key}) : super(key: key);

  @override
  State<CategorySheet> createState() => _CategorySheetState();
}

class _CategorySheetState extends State<CategorySheet> {
  //String selectedCategory = "";

  CategoryModel? selectedCategory;
  @override
  void initState() {
    super.initState();
    AppController controller = Provider.of(context, listen: false);
    if (controller.categoryList.isNotEmpty) {
      return;
    }
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      controller.busyScreen();
    });
    getCategories().then((value) {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        controller.idleScreen();
        getBanks().then((value) {});
      });
    }).onError((error, stackTrace) {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        controller.idleScreen();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppController>(
      builder: (context, appController, child) {
        return appController.isScreenBusy
            ? Container(
                height: MediaQuery.of(context).size.height * 0.8,
                width: double.infinity,
                child: Center(child: const CircularProgressIndicator()))
            : Container(
                padding: const EdgeInsets.all(16),
                height: MediaQuery.of(context).size.height * 0.8,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const CircleAvatar(
                              backgroundColor: Palette.gray,
                              child: Icon(
                                Icons.clear,
                                color: Palette.fieldText,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Image.asset(
                        "assets/icons/category_icon.png",
                        width: 100,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "Primary Celebrity Category",
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            color: Palette.textBlue),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const Text(
                        "Please select a primary celebrity category that defines your offering",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: Palette.gray2),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      appController.categoryList.isEmpty
                          ? Container()
                          : Wrap(
                              spacing: 5,
                              runSpacing: 10,
                              direction: Axis.horizontal,
                              children: List.generate(
                                  appController.categoryList.length, (index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedCategory =
                                          appController.categoryList[index];
                                    });
                                  },
                                  child: CategorySelect(
                                      selectedCategory ==
                                              appController.categoryList[index]
                                          ? true
                                          : false,
                                      appController.categoryList[index].name),
                                );
                              }),
                            ),
                      const SizedBox(
                        height: 25,
                      ),
                      SolidButton(() {
                        AppController controller =
                            Provider.of<AppController>(context, listen: false);
                        controller.updatePrimaryCategory(selectedCategory!);
                        Navigator.pop(context);
                      })
                    ],
                  ),
                ),
              );
      },
    );
  }

  Future<void> getCategories() async {
    AppController controller = Provider.of(context, listen: false);
    var res = await ApiService.get<CategoryResponseModel>(
        ApiRoutes.onboarding.getCategories,
        converter: CategoryResponseModel.fromList);

    for (int i = 0; i < (res.data!.data).length; i++) {
      controller.categoryList.add(CategoryModel.fromMap(res.data!.data[i]));
    }
  }

  Future<void> getBanks() async {
    AppController controller = Provider.of(context, listen: false);

    var url = Uri.parse('https://api.paystack.co/bank?country=nigeria');
    var response = await http.get(url, headers: {
      'Authorization': 'Bearer sk_live_69fa43ee7d62e702f40fbad9c7a90baa53a4374a'
    });

    var bankList = jsonDecode(response.body);
    List listOfBanks = bankList["data"] as List;
    print(listOfBanks);
    for (int i = 0; i < listOfBanks.length; i++) {
      controller.banks.add(BankModel.fromMap(listOfBanks[i]));
    }
  }
}
