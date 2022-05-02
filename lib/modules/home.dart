import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:task_flutter/constants/constant.dart';
import 'package:task_flutter/modules/Success_quiz.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int? selectedIndex;
List list = ['A. Milky Way', 'B. Milky Way', 'C. Milky Way'];

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Alert(
              context: context,
              content: StatefulBuilder(builder: (context, setState) {
                return AlertContent(context,setState);
              }),
              buttons: [],
            ).show();
          },
          child: const Text(
            'Take a quiz',
            style: TextStyle(color: Colors.black),
          ),
          style: ElevatedButton.styleFrom(primary: Colors.white),
        ),
      ),
    );
  }

}
  Widget AlertContent(context,setState) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: const Text(
                  "Time to get rewarded",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
              Expanded(child: Image.asset('assets/images/img.jpeg')),
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Text(
            "You can fit all of the planets in the ______ between the Earth and Moon with a little space left over.",
            style: TextStyle(fontSize: 20.0),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Container(
              margin:
              EdgeInsets.only(left: 20.0, top: 20.0, right: 20.0),
              width: 200.0,
              height: 200.0,
              child: ListView.separated(
                separatorBuilder: (context, index) =>
                    SizedBox(
                      height: 10.0,
                    ),
                itemBuilder: (context, index) {
                  var listOfChoices = list;
                  var choice = listOfChoices[index];
                  return Answers(choice, () {
                    setState(() {
                      selectedIndex = index;
                      print(selectedIndex);
                    });
                  }, index);
                },
                itemCount: list.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
              )),
          const SizedBox(
            height: 50.0,
          ),
          DialogButton(
            onPressed: () {
              setState(() {
                if (selectedIndex != null) {
                  Alert(
                    context: context,
                    content: StatefulBuilder(builder: (context, setState) {
                      return QuizSuccess(context,setState);
                    }),
                    buttons: [],
                  ).show();
                } else {}
              });
            },
            color: selectedIndex != null
                ? secondGradient
                : Color(0xffEEEEEE),
            width: 210.0,
            height: 40.0,
            child: const Text(
              "Submit",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          DialogButton(
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.transparent,
            width: 150.0,
            child: const Text(
              "Take quiz later",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

Answers(String answer, Function()? onTap, int index) {
  return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50.0,
        width: 70.0,
        margin: EdgeInsets.only(right: 15.0),
        decoration: BoxDecoration(
          color: Color(0xffEEEEEE),
          border: Border.all(
              color:
                  index == selectedIndex ? secondGradient : Color(0xffEEEEEE)),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Text(
                answer,
                style: TextStyle(
                  color: index == selectedIndex ? secondGradient : Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ));
}
