import 'package:flutter/material.dart';
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
          drawer: CustomDrawer(),
        )
      ],
    );
  }
}


