import 'package:flutter/material.dart';
import 'package:pipoc_app/Banco/Movies.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {




  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("PIPOC"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.red,
      body: Center(

      )


      /*physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Container(color: Colors.yellow,),
        Container(color: Colors.red)
      ],
      appBar: AppBar(
        title: Text("PIPOC"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.red,*/
    );
  }
}
