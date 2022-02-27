import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temple/components/category_select.dart';
import 'package:temple/components/custom_block.dart';
import 'package:temple/components/solid_button.dart';
import 'package:temple/controller/logic_controller.dart';
import 'package:temple/models/services_model.dart';
import 'package:temple/network/api_routes.dart';
import 'package:temple/network/api_service.dart';
import 'package:temple/utils/constants.dart';
import 'package:temple/utils/services.dart';

import 'create_account5.dart';

class AccountCreate4 extends StatefulWidget {
  AccountCreate4({Key? key}) : super(key: key);

  @override
  State<AccountCreate4> createState() => _AccountCreate4State();
}

class _AccountCreate4State extends State<AccountCreate4> {
  bool isScreenLoading = false;
  int? selectedIndex;

  @override
  void initState() {
    super.initState();

    AppController controller = Provider.of(context, listen: false);
    if (controller.serviceList.isNotEmpty) {
      return;
    }
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      setState(() {
        isScreenLoading = true;
      });
    });
    getServices().then((value) {
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        setState(() {
          isScreenLoading = false;
        });
      });
    }).onError((error, stackTrace) {
      setState(() {
        isScreenLoading = false;
      });
    });
  }

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
                SingleChildScrollView(
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
                                isScreenLoading
                                    ? Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.3,
                                        child: const Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      )
                                    : Column(
                                        children: List.generate(
                                            appController.serviceList.length,
                                            (index) {
                                          return Container(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 4),
                                            padding: const EdgeInsets.all(8),
                                            decoration: BoxDecoration(
                                                color: selectedIndex == index
                                                    ? const Color(0xffFEF2F9)
                                                    : Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                border: Border.all(
                                                    color:
                                                        selectedIndex == index
                                                            ? const Color(
                                                                0xffE6007e)
                                                            : const Color(
                                                                0xffE3E0E0))),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      appController
                                                          .serviceList[index]
                                                          .name,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w700,
                                                          color: selectedIndex ==
                                                                  index
                                                              ? const Color(
                                                                  0xffaA4866)
                                                              : const Color(
                                                                  0xffA5a3B2)),
                                                    ),
                                                    Radio(
                                                        activeColor:
                                                            const Color(
                                                                0xffE6007e),
                                                        value: selectedIndex ==
                                                                index
                                                            ? true
                                                            : false,
                                                        //  toggleable: true,
                                                        groupValue: true,
                                                        onChanged:
                                                            (bool? value) {
                                                          setState(() {
                                                            selectedIndex =
                                                                index;
                                                            appController
                                                                    .selectedService =
                                                                appController
                                                                        .serviceList[
                                                                    index];
                                                          });
                                                        })
                                                  ],
                                                ),
                                                Text(
                                                  appController
                                                      .serviceList[index]
                                                      .description,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      color:
                                                          selectedIndex == index
                                                              ? const Color(
                                                                  0xffaA4866)
                                                              : const Color(
                                                                  0xffA5a3B2)),
                                                ),
                                              ],
                                            ),
                                          );
                                        }),
                                      )
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SolidButton(() {
                    if (selectedIndex == null) {
                      Services().showToast("select service");
                    } else {
                      appController.updateData["serviceInformation"] = [{}];
                      appController.updateData["serviceInformation"][0]
                          ["serviceId"] = appController.selectedService!.id;
                      print(appController.updateData);
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

  Future<void> getServices() async {
    AppController controller = Provider.of(context, listen: false);
    var res = await ApiService.get<ServiceResponseModel>(
        ApiRoutes.onboarding.getServices,
        converter: ServiceResponseModel.fromMap);

    for (int i = 0; i < (res.data!.data).length; i++) {
      controller.serviceList.add(ServicesModel.fromMap(res.data!.data[i]));
    }
  }
}
