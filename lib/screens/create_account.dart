import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:temple/components/category_box.dart';
import 'package:temple/components/check_widget.dart';
import 'package:temple/components/custom_textfield.dart';
import 'package:temple/components/mail_button.dart';
import 'package:temple/controller/logic_controller.dart';
import 'package:temple/models/signup_model.dart';
import 'package:temple/network/api_routes.dart';
import 'package:temple/network/api_service.dart';
import 'package:temple/screens/create_account2.dart';
import 'package:temple/utils/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:temple/utils/services.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  _CreateAccountScreenState createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  TextEditingController? emailController = TextEditingController();
  TextEditingController? phoneController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();
  TextEditingController? firstNameController = TextEditingController();
  TextEditingController? lastNameController = TextEditingController();
  TextEditingController? celebrityNameController = TextEditingController();
  TextEditingController? countryController = TextEditingController();
  TextEditingController? cityController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<AppController>(
      builder: (context, appController, child) {
        return ModalProgressHUD(
          inAsyncCall: appController.isScreenBusy,
          child: Scaffold(
            backgroundColor: Palette.bgColor,
            body: SafeArea(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Stack(
                              children: [
                                Column(
                                  children: [
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Center(
                                      child: Image.asset(
                                        "assets/icons/mail_icon.png",
                                        width: 120,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      "Create an Account",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      "And access the richest collection of celebrities and amaze-ing people",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Flexible(
                                            child: CustomTextField(
                                                "First name",
                                                firstNameController,
                                                TextInputType.text)),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Flexible(
                                            child: CustomTextField(
                                                "Last name",
                                                lastNameController,
                                                TextInputType.text)),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    CustomTextField(
                                        "Celebrity AKA",
                                        celebrityNameController,
                                        TextInputType.text),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    CustomTextField(
                                        "Email Address",
                                        emailController,
                                        TextInputType.emailAddress),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                          width: 120,
                                          height: 50,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(8)),
                                              border: Border.all(
                                                  color:
                                                      Palette.textFieldBorder)),
                                          child: Row(
                                            children: [
                                              CountryCodePicker(
                                                onChanged: (countryCode) {},
                                                flagWidth: 30,
                                                initialSelection: 'NG',
                                                padding:
                                                    const EdgeInsets.all(0),
                                                // textStyle: TextStyle(
                                                //    color: widget.lightMode ? bunkerBlack : baliGrey,
                                                //     ),
                                                showFlagMain: true,
                                                flagDecoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4)),
                                                //shape: BoxShape.circle),
                                              ),
                                              const Icon(
                                                Icons.arrow_drop_down,
                                                color: Palette.iconColor,
                                                size: 15,
                                              )
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Flexible(
                                            child: CustomTextField(
                                                "Phone number",
                                                phoneController,
                                                TextInputType.phone)),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    CustomTextField("Country of Residence",
                                        countryController, TextInputType.text),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    CustomTextField("City", cityController,
                                        TextInputType.text),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    CategoryBox(appController.primaryCategory ==
                                            null
                                        ? ""
                                        : appController.primaryCategory!.name),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    CustomTextField("Password",
                                        passwordController, TextInputType.text),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Wrap(
                                      spacing: 5,
                                      runSpacing: 10,
                                      alignment: WrapAlignment.center,
                                      children: List.generate(
                                          appController
                                              .passwordFieldChecks.length,
                                          (index) => getPasswordCheckWidget(
                                              appController
                                                  .passwordFieldChecks[index])),
                                    ),
                                    const Text.rich(
                                      TextSpan(
                                        text:
                                            'By creating an account, you agree to Amaze\'s ',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xff140432)),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: 'Terms of service',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: Palette.errorField,
                                                height: 1.5,
                                                decoration:
                                                    TextDecoration.underline),
                                          ),
                                          TextSpan(
                                            text: ' and',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff140432),
                                              height: 1.5,
                                            ),
                                          ),
                                          TextSpan(
                                            text: ' Privacy Policies.',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: Palette.errorField,
                                                height: 1.5,
                                                decoration:
                                                    TextDecoration.underline),
                                          ),
                                        ],
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    MailButton(() {
                                      if (_formKey.currentState!.validate()) {
                                        if (appController
                                                .passwordFieldChecks.length <
                                            3) {
                                          Services().showToast(
                                              "password must contain uppercase,"
                                              "lowercase & special characters");
                                        } else if (appController
                                                .primaryCategory ==
                                            null) {
                                          Services().showToast(
                                              "select primary category");
                                        } else {
                                          print("ff");
                                          appController.busyScreen();
                                          signUp().then((value) {
                                            appController.idleScreen();
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      AccountCreate2()),
                                            );
                                          }).onError((error, stackTrace) {
                                            appController.idleScreen();
                                          });
                                        }
                                      }
                                    })
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Image.asset(
                                    "assets/icons/icon_back_button.png",
                                    width: 40,
                                  ),
                                )
                              ],
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> signUp() async {
    AppController controller = Provider.of(context, listen: false);

    Map data = {
      "firstName": firstNameController!.text,
      "lastName": lastNameController!.text,
      "email": emailController!.text,
      "phoneNumber": phoneController!.text,
      "password": passwordController!.text,
      "jobTitle": "",
      "location": countryController!.text,
      "companyName": "",
      "celebrityAka": celebrityNameController!.text,
      "primaryCelebrityCategory": controller.primaryCategory!.id,
      "userType": 0
    };
    print(data);
    var res = await ApiService.post<SignUpResponseModel>(
        ApiRoutes.onboarding.signUp, data,
        converter: SignUpResponseModel.fromMap);

    if (res.notSucceeded) {
      Services().showToast(res.message!);
      return;
    }

    controller.userInfo = res.data;
    controller.updateData["id"] = controller.userInfo!.id;
  }

  Widget getPasswordCheckWidget(String value) {
    switch (value) {
      case UPPER_CASE_CHECK:
        return CheckWidget("Capital Letters");
      case LOWER_CASE_CHECK:
        return CheckWidget("Lowercase Letters");
      case SPECIAL_SYMBOL_CHECK:
        return CheckWidget("Special Characters");
      default:
        return Container();
    }
  }
}
