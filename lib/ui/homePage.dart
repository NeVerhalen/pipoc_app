import 'package:flutter/material.dart';
import 'package:pipoc_app/Banco/People.dart';
import 'package:pipoc_app/ui/main_screen.dart';
import 'package:pipoc_app/ui/start_page.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  PeopleHelper helper = PeopleHelper();

  @override
  void initState() {
    super.initState();

    /*People c = People();
    c.email = "ju.micolino@hotmail.com";
    c.senha = "6789";*//*

    helper.savePeople(c);*/

    helper.getAllPeople().then((list){
      print(list);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget>[
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration:  InputDecoration(
                fillColor: Colors.white,
                filled: true,
                contentPadding:  EdgeInsets.fromLTRB(
                    10.0, 10.0, 10.0, 10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                labelText: "email",
                labelStyle: TextStyle(color: Colors.red)
            ),
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.red, fontSize: 15.0),

          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration:  InputDecoration(
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.fromLTRB(
                    10.0, 10.0, 10.0, 10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                labelText: "senha",
                labelStyle: TextStyle(color: Colors.red)
            ),
            textAlign: TextAlign.justify,
            style: TextStyle(color: Colors.red, fontSize: 15.0),
          ),


           // child: Container(
               // height: 35.0,
               // width: 300.0,
                 RaisedButton(
                   onPressed: (){
                     // ignore: unused_local_variable
                     body: var mainScreen = MainScreen();
                   },
                  child: Text("ENTRAR",
                    style: TextStyle(color: Colors.white, fontSize: 15.0
                  ),
                  ),
                  color: Colors.redAccent,
                ),
        ],
      ),
    );

  }
}


