import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main()async {
  runApp(Teste());
}
class Teste extends StatelessWidget{
  
  DocumentSnapshot snapshot;
  
  @override
  Widget build(BuildContext context){
    return Scaffold
      (
      body: Container(
        child: Center(
          child: RaisedButton(
            onPressed: Data,
          ),
        ),
      ),
    );
  }

  void Data() async {
   await Firestore.instance.collection("Teste").document("Teste2").setData({"Nome":"Filme"});

    snapshot = await Firestore.instance.collection("Filmes").document("filme1").get();
    print(snapshot.data);
  }
}