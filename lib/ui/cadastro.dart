import 'package:flutter/material.dart';

class Cadastro extends StatelessWidget{

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PIPOC"),
        centerTitle: true,
        backgroundColor: Colors.red,

      ),
      backgroundColor: Colors.white,
      body:
      Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            SizedBox(height: 10.0, ),
            TextFormField(
              //TEXT FORM FIELD DO NOME
              validator: (text){
                if(text.isEmpty ) return
                  "Nome inválido";
              },
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: EdgeInsets.fromLTRB(
                      10.0, 10.0, 10.0, 10.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  labelText: "Nome Completo",
                  labelStyle: TextStyle(color: Colors.red)
              ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.red, fontSize: 15.0),
            ),

            SizedBox(height: 10.0, ),

            TextFormField( //TEXT FORM FIELD DO E-MAIL
              keyboardType: TextInputType.emailAddress,
              validator: (text){
                if(text.isEmpty) return
                  "E-mail inválido";
              },
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
              ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.red, fontSize: 15.0),
            ),

            SizedBox(height: 10.0, ),
            TextFormField(
              keyboardType: TextInputType.number,
              validator: (text){
                if(text.isEmpty || text.length < 8) return "Senha inválida";
              },
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
                onPressed: (){
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

          ],


        ),

      ),
    );
  }
}
