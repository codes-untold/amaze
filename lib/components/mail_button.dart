import 'package:flutter/material.dart';

class MailButton extends StatelessWidget {
  MailButton(this.callback, {Key? key}) : super(key: key);

  VoidCallback callback;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            width: double.infinity,
            height: 60,
            child: const Center(
                child: Text(
              "Continue",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
            )),
            decoration: const BoxDecoration(
                color: Color(0xff140432),
                borderRadius: BorderRadius.all(Radius.circular(32))),
          ),
          const CircleAvatar(
            radius: 25,
            child: Icon(
              Icons.mail,
              color: Color(0xff140432),
            ),
            backgroundColor: Colors.white,
          )
        ],
      ),
    );
  }
}
