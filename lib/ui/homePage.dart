import 'package:flutter/material.dart';
import 'package:pipoc_app/Banco/People.dart';
import 'package:pipoc_app/ui/main_screen.dart';
import 'package:pipoc_app/ui/start_page.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';


void homePage()async{
  runApp(HomePage());
}
final googleSignIn = GoogleSignIn();
final auth = FirebaseAuth.instance;

Future<Null>_ensureLoggedIn() async {
  GoogleSignInAccount user = googleSignIn.currentUser;
  if(user == null)
    user = await googleSignIn.signInSilently();
  if (user == null)
    user = await googleSignIn.signIn();
  if(await auth.currentUser() == null){
    GoogleSignInAuthentication credentials = await googleSignIn.currentUser.authentication;
    await auth.linkWithCredential(GoogleAuthProvider.getCredential(idToken: credentials.idToken, accessToken: credentials.accessToken)
        );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  PeopleHelper helper = PeopleHelper();

  @override
  void initState() {
    /*super.initState();

    *//*People c = People();
    c.email = "ju.micolino@hotmail.com";
    c.senha = "6789";*//**//*

    helper.savePeople(c);*//*

    helper.getAllPeople().then((list){
      print(list);
    });*/
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
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => MainScreen()
                ),
              );
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


