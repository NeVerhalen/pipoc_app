import 'package:flutter/material.dart';
import 'package:pipoc_app/Banco/People.dart';
import 'package:pipoc_app/models/user_model.dart';
import 'package:pipoc_app/ui/main_screen.dart';
import 'package:pipoc_app/ui/start_page.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pipoc_app/ui/cadastro.dart';
import 'package:pipoc_app/ui/tiles/DrawerTile.dart';
import 'package:pipoc_app/widget/custom_drawer.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:pipoc_app/ui/tab/HomeTab.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PeopleHelper helper = PeopleHelper();


  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _pageController = PageController();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text("PIPOC"),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: ScopedModelDescendant<UserModel>(
          builder: (context, child, model){
            if(model.isLoading)
              return Center(child: CircularProgressIndicator(),
              );
            return Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  SizedBox(height: 180.0),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (text){
                      if(text.isEmpty || !text.contains("@")) return
                        ("E-mail inválido");
                    },
                    decoration:  InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding:  EdgeInsets.fromLTRB(
                            20.0, 10.0, 10.0, 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        labelText: "E-mail",
                        labelStyle: TextStyle(color: Colors.red)
                    ),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.red, fontSize: 15.0),
                  ),
                  SizedBox(height: 10.0,),
                  TextFormField(
                    controller: _passController,
                    keyboardType: TextInputType.number,
                    validator: (text){
                      if(text.isEmpty || text.length < 8) return "Senha inválida";
                    },
                    decoration:  InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: EdgeInsets.fromLTRB(
                            20.0, 10.0, 10.0, 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        labelText: "Senha",
                        labelStyle: TextStyle(color: Colors.red)
                    ),
                    obscureText: true,
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.red, fontSize: 15.0),
                  ),
                  SizedBox(height: 20.0,),


                  // child: Container(
                  // height: 35.0,
                  // width: 300.0,
                  Align(
                    alignment: Alignment.center,
                    child: RaisedButton(
                      onPressed: (){
                        if(_formKey.currentState.validate()){
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) => HomeTab())

                          );

                        }
                        model.signIn(
                          email: _emailController.text,
                          pass: _passController.text,
                          onSuccess: _onSuccess,
                          onFail: _onFail,

                        );

//              Navigator.of(context).push(
//                MaterialPageRoute(
//                  builder: (context) => MainScreen(),
//                ),
//              );
                      },
                      child: Text("ENTRAR",
                        style: TextStyle(color: Colors.black, fontSize: 15.0
                        ),
                      ),
                      color: Colors.redAccent,
                    ),
                  ),
                  SizedBox(height: 2.0,),
                  Align(
                    alignment: Alignment.center,
                    child: RaisedButton(
                      onPressed: (){
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => Cadastro())
                        );
//              Navigator.of(context).push(
//                MaterialPageRoute(
//                  builder: (context) => MainScreen(),
//                ),
//              );
                      },
                      child: Text("CRIAR CONTA",
                        style: TextStyle(color: Colors.black, fontSize: 15.0
                        ),
                      ),
                      color: Colors.blueAccent,
                    ),
                  ),
                  Align(
                    alignment:  Alignment.center,
                    child: FlatButton(onPressed: (){},
                      child: Text("Esqueci minha senha",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.black, fontSize: 15.0,
                        ),
                      ),

                    ),
                  )
                ],


              ),

            );
          },
        )

    );

  }
  void _onSuccess(){
    Navigator.of(context).pop();
  }
  void _onFail(){

  }
}

