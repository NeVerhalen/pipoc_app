import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pipoc_app/ui/homePage.dart';
import 'package:pipoc_app/ui/tab/GPSTab.dart';
import 'package:pipoc_app/ui/tab/HomeTab.dart';
import 'package:pipoc_app/widget/custom_drawer.dart';

class MainScreen extends StatelessWidget {


  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    ThemeData(primaryColor: Colors.red);
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          body: HomeTab(),
          drawer: CustomDrawer(_pageController),
        ),
        Container(color: Colors.white,),
        Scaffold(
          appBar: AppBar(
            title: Text("Onde estou"),
            centerTitle: true,
          ),
          drawer: CustomDrawer(_pageController),
          body: GPSTab(),
        ),
        Scaffold(
          drawer: CustomDrawer(_pageController),
          body: HomePage(),
        ),
      ],
    );
  }
}



