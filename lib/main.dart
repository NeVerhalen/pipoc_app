import 'package:flutter/material.dart';
import 'package:pipoc_app/ui/cadastro.dart';
import 'package:pipoc_app/ui/homePage.dart';
import 'package:pipoc_app/ui/GridMovies.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pipoc_app/ui/main_screen.dart';
import 'package:pipoc_app/ui/principal_filme.dart';
import 'package:pipoc_app/Teste.dart';
import 'package:pipoc_app/ui/tab/HomeTab.dart';



void main() => runApp(new Pipoc());

class Pipoc extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "Pipoc",
<<<<<<< HEAD
      home: MyApp(),
  ));

=======
      home: HomePage(),
    );
  }
>>>>>>> origin/newcommit
}
/*final googleSignIn = GoogleSignIn();
final auth = FirebaseAuth.instance;

/*Future<Null>_ensureLoggedIn() async {
  GoogleSignInAccount user = googleSignIn.currentUser;
  if(user == null)
  user = await googleSignIn.signInSilently();
  if(user == null)
    user = await googleSignIn.signIn();
  if(await auth.currentUser() == null){
    GoogleSignInAuthentication credentials = await googleSignIn.currentUser.authentication;
    await auth.signInWithGoogle(
        email:credentials.idToken, password: credentials.accessToken);

  }*/

<<<<<<< HEAD
}*/
=======
>>>>>>> origin/newcommit




