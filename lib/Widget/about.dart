import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'package:clipboard/clipboard.dart';
import 'package:fluttertoast/fluttertoast.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width * 0.85,
      height: height * 0.8,
      child: Column(
        children: [
          SizedBox(height: height*0.1),
          Container(
            color: Colors.amberAccent,
            height: 55,
            width: width,
            child: Center(
                child: Text(
              "Ahmad Einieh",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            )),
          ),
          Container(
            color: Colors.yellow,
            height: 55,
            width: width,
            child: TextButton(
              onPressed: () {
                FlutterClipboard.copy('abomoaz3375@gmail.com').then((value) =>
                    Fluttertoast.showToast(
                        msg: "Copied",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0));
                /*;*/
              },
              child: Text(
                "abomoaz3375@gmail.com",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ),
          Container(
            color: Colors.amberAccent,
            height: 55,
            width: width,
            child: TextButton(
              onPressed: () {
                html.window.open("https://github.com/ahmad-prog", "_blank");
              },
              child: Text(
                "Git-Hub",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ),
          Container(
            color: Colors.yellow,
            height: 55,
            width: width,
            child: Center(
              child: Text(
                "king Saud university",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ),
          Container(
            color: Colors.amberAccent,
            height: 55,
            width: width,
            child: TextButton(
              onPressed: () {
                html.window.open("https://paypal.me/proahmad?locale.x=ar_EG", "_blank");
              },
              child: Text(
                "PayPal",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
