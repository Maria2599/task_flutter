import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:task_flutter/modules/home.dart';

import '../constants/constant.dart';

Widget QuizSuccess(context, setState) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/right.png',
          width: 150,
          height: 150,
        ),
        const SizedBox(
          height: 20.0,
        ),
        const Text(
          "Good Job!",
          style: TextStyle(fontSize: 40.0),
        ),
        const SizedBox(
          height: 30.0,
        ),
        Center(
          child: const Text(
            "You have rewarded 9 points check your progress on your profile",
            style: TextStyle(fontSize: 20.0),
          ),
        ),
        const SizedBox(
          height: 50.0,
        ),
        DialogButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
              (Route<dynamic> route) => false,
            );
          },
          color: secondGradient,
          width: 210.0,
          height: 40.0,
          child: const Text(
            "Continue to app",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  );
}
