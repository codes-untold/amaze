import 'package:flutter/material.dart';
import 'package:temple/components/gradient_outline_button.dart';
import 'package:temple/components/outline_button.dart';
import 'package:temple/screens/create_account.dart';
import 'package:temple/utils/constants.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/images/onboarding_image.png",
                      ),
                      fit: BoxFit.fill))),
          Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/onboarding_gradient.png"),
                    fit: BoxFit.fill),
              )),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/icons/speaker_icon.png",
                  width: 30,
                ),
                const SizedBox(
                  height: 10,
                ),
                Image.asset(
                  "assets/icons/Amaze-ing.png",
                  width: 100,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Amaze We help bridge the gap between celebrities and their fans.",
                  style: TextStyle(color: Palette.white),
                ),
                const SizedBox(
                  height: 20,
                ),
                OutLineButton(
                    Palette.textWhite,
                    const Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    )),
                const SizedBox(
                  height: 10,
                ),
                GradientOutLineButton(
                    const Text(
                      "Create an Account",
                      style: TextStyle(color: Palette.gradientText),
                    ), () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CreateAccountScreen()),
                  );
                })
              ],
            ),
          )
        ],
      )),
    );
  }
}
