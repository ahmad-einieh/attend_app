import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final TabController controller;
  final List<Widget> tabs;

  const CustomTabBar({Key? key, required this.controller, required this.tabs})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent),
      child: TabBar(
        controller: controller,
        tabs: tabs,
        indicatorColor: /*Color(0xff21a179)*/Colors.yellow,
      ),
    );
  }
}
