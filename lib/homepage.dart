import 'package:attend_app/content_view.dart';
import 'package:attend_app/custom_tab_bar.dart';
import 'package:attend_app/customtab.dart';
import 'package:flutter/material.dart';

import 'Widget/about.dart';
import 'Widget/home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  double? screenHeight;
  double? screenWidth;
  double? topPadding;
  double? buttonPadding;
  late TabController tabController;
  List<ContentView> contentViews = [
   ContentView(Tab: CustomTab('Home'), content: Center(child: Home())),
    ContentView(
        Tab: CustomTab('About'),
        content: Center(
            child: About())),
   /* ContentView(
        Tab: CustomTab('Project'),
        content: Center(
            child: Container(color: Colors.red, width: 100, height: 100))),*/
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: contentViews.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    topPadding = screenHeight! * 0.01;
    buttonPadding = screenHeight! * 0.01;
    return Scaffold(
      //endDrawer: drawer(),
      key: scaffoldKey,
      backgroundColor: Color(0xff1e1e24),
      body: Padding(
        padding: EdgeInsets.only(
            /*bottom: buttonPadding as double,*/ top: topPadding as double),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            /*if (constraints.maxWidth > 715)
              return DesktopView();
            else
              return MobileView();*/
            return DesktopView();
          },
        ),
      ),
    );
  }

  /*Widget MobileView() {
    return Padding(
      padding: EdgeInsets.only(
          left: screenWidth! * 0.05, right: screenWidth! * 0.05),
      child: Container(
        width: screenWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(
                iconSize: screenWidth! * 0.08,
                onPressed: () => scaffoldKey.currentState!.openEndDrawer(),
                icon: Icon(Icons.menu_rounded),
                color: Colors.white),
          ],
        ),
      ),
    );
  }*/

 /* Widget drawer() {
    return Drawer(
      child: ListView(
        children: [
              Container(
                height: screenHeight! * 0.1,
              ),
            ] +
            contentViews
                .map((e) => Container(
                        child: ListTile(
                      title: Text(e.Tab.title),
                      onTap: (){
                        e.Tab.title == 'Home'?Home():Home();
                      } ,
                    )))
                .toList(),
      ),
    );
  }*/

  Widget DesktopView() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomTabBar(
            controller: tabController,
            tabs: contentViews.map((e) => e.Tab).toList(),
          ),
          Container(
            height: screenHeight! * 0.8,
            child: TabBarView(
              controller: tabController,
              children: contentViews.map((e) => e.content).toList(),
            ),
          )
        ],
      ),
    );
  }
}
