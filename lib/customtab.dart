import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget {
  final String title;

  CustomTab(this.title);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Tab(
      child: Text(
        this.title,
        style: TextStyle(fontSize:width<=111?width*0.05:17),
      ),
    );
  }
}
