import 'package:flutter/material.dart';
import 'dart:async';
import 'package:pipoc_app/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
        appBar: AppBar(
          title: Text("PIPOC"),
          centerTitle: true,
          backgroundColor: Colors.red,

        ),
        backgroundColor: Colors.white,
        body:
        ScopedModelDescendant<UserModel>(
          builder: (context, child, model){
            if (model.isLoading)
              return Center(child: CircularProgressIndicator(),);
            return  Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  SizedBox(height: 10.0, ),
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: EdgeInsets.fromLTRB(
                            10.0, 10.0, 10.0, 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        hintText: "Nome Completo",
                        hintStyle: TextStyle(color: Colors.red)
                    ),

                    //TEXT FORM FIELD DO NOME
                    validator: (text){
                      if(text.isEmpty ) return
                        "Nome inválido";
                    },
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.red, fontSize: 15.0),
                  ),

                  SizedBox(height: 10.0, ),

                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: EdgeInsets.fromLTRB(
                            10.0, 10.0, 10.0, 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        labelText: "E-mail",
                        labelStyle: TextStyle(color: Colors.red)
                    ),//TEXT FORM FIELD DO E-MAIL
                    keyboardType: TextInputType.emailAddress,
                    validator: (text){
                      if(text.isEmpty|| !text.contains("@")) return
                        "E-mail inválido";
                    },

                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.red, fontSize: 15.0),
                  ),

                  SizedBox(height: 10.0, ),
                  TextFormField(
                    controller: _passController,
                    decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        contentPadding: EdgeInsets.fromLTRB(
                            10.0, 10.0, 10.0, 10.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        labelText: "Senha",
                        labelStyle: TextStyle(color: Colors.red)
                    ),
                    keyboardType: TextInputType.number,
                    validator: (text){
                      if(text.isEmpty || text.length < 8) return "Senha inválida";
                    },

                    obscureText: true,
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.red, fontSize: 15.0),
                  ),


// child: Container(
// height: 35.0,
// width: 300.0,
                  Align(
                    alignment: Alignment.center,
                    child: RaisedButton(
                      child: Text("CRIAR CONTA",
                        style: TextStyle(color: Colors.black, fontSize: 15.0
                        ),
                      ),
                      onPressed: (){
                        if(_formKey.currentState.validate()){

                          Map<String, String> userData = {
                            "nome": _nameController.text,
                            "email": _emailController.text,
                          };

                          model.signUp(userData: userData,
                              pass: _passController.text,
                              onSuccess: _onSuccess,
                              onFail: _onFail,);

                        }
//              Navigator.of(context).push(
//                MaterialPageRoute(
//                  builder: (context) => MainScreen(),
//                ),
//              );
                      },

                      color: Colors.blueAccent,
                    ),
                  ),

                ],


              ),

            );
          },
        )

    );
  }
  void _onSuccess(){
_scaffoldKey.currentState.showSnackBar(
    SnackBar(content: Text("Usuário Criado com Sucesso!"),
     backgroundColor: Theme.of(context).primaryColor,
    duration: Duration(seconds: 2),
      )
   );
   Future.delayed(Duration(seconds: 2)).then((_){
     Navigator.of(context).pop();
   });

  }
  void _onFail(){

   _scaffoldKey.currentState.showSnackBar(
       SnackBar(content: Text("Usuário Não Foi Criado com Sucesso!"),
          backgroundColor: Theme.of(context).primaryColor,
          duration: Duration(seconds: 2),
        )
    );
    Future.delayed(Duration(seconds: 2)).then((_){
     Navigator.of(context).pop();
    });
  }
}

