import 'package:flutter/material.dart';

class AccountCreate9 extends StatefulWidget {
  const AccountCreate9({Key? key}) : super(key: key);

  @override
  _AccountCreate9State createState() => _AccountCreate9State();
}

class _AccountCreate9State extends State<AccountCreate9> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/icons/box.png",
                width: 200,
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Amaze-ing!!!",
                style: TextStyle(
                    color: Color(0xff1d1a42),
                    fontWeight: FontWeight.w700,
                    fontSize: 20),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Your application is undergoing review. "
                "You will receive a notification once the review is complete.",
                style: TextStyle(
                    color: Color(0xff140432),
                    fontWeight: FontWeight.w400,
                    fontSize: 14),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: 70,
                  child: const Center(
                      child: Text(
                    "Continue",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  )),
                  decoration: const BoxDecoration(
                      color: Color(0xffE6007E),
                      borderRadius: BorderRadius.all(Radius.circular(32))),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
