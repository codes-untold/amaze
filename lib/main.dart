import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:temple/screens/create_account.dart';
import 'package:temple/screens/create_account2.dart';
import 'package:temple/screens/create_account3.dart';
import 'package:temple/screens/create_account4.dart';
import 'package:temple/screens/create_account5.dart';
import 'package:temple/screens/create_account6.dart';
import 'package:temple/screens/create_account7.dart';
import 'package:temple/screens/create_account8.dart';
import 'package:temple/screens/create_account9.dart';
import 'package:temple/screens/onboarding.dart';

import 'controller/logic_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppController>(
        create: (_) => AppController(),
        builder: (context, child) {
          return MaterialApp(
            initialRoute: '/',
            routes: {
              // When navigating to the "/" route, build the FirstScreen widget.
              '/': (context) => const OnboardingScreen(),
            },
            //  home: AccountCreate9(),
          );
        });
  }
}
