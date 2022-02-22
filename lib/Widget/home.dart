import 'dart:html' as html;

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: width * 0.90,
            padding: EdgeInsets.only(top: height*0.05),
            child: TextField(
              controller: myController,

              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'enter the link',
                filled: true,
                fillColor: Colors.yellow,
                contentPadding:
                    const EdgeInsets.only(left: 14.0, bottom: 6.0, top: 8.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          SizedBox(height: height * 0.10),
          ElevatedButton(
            onPressed: () {
              html.window.open(change(myController.text), "_blank");
              myController.clear();
            },
            child: Text("get"),
            style: ElevatedButton.styleFrom(
                primary: Colors.yellow,
                fixedSize: Size(200, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50))),
          ),
          SizedBox(height: height * 0.05),
          DefaultTextStyle(
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontSize: 15.0, fontFamily: 'Agne', color: Colors.yellow),
            child: Align(
              alignment: Alignment(0, 0),
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                      'سجل الدخول لحساب البلاك بورد ثم انسخ رابط المادة والصقه'),
                ],
              ),
            ),
          ),
          Container(height: height*0.33,),
        ],
      ),
    );
  }

  int search(String a) {
    if (a.indexOf("&mode") == -1) return a.length - 1;
    return a.indexOf("&mode");
  }

  int search1(String a) {
    return a.indexOf("course_id");
  }

  int search2(String a) {
    return a.indexOf("webapps/");
  }

  String change(String a) {
    String s;
    s = a.substring(0, search2(a) + 8) +
        "attendance/myGradesAttendance?" +
        a.substring(search1(a), search(a));
    print(s);
    return s;
  }
}
