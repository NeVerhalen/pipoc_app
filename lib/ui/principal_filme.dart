import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class Principal{

  String category;
  String id;
  String title;
  String image;
  String sinopse;
  String date;

  Principal.fromDocument(DocumentSnapshot snapshot){
    id = snapshot.documentID;
    title = snapshot.data["title"];
    sinopse = snapshot.data["sinopse"];
    image = snapshot.data["imagem"];
    date = snapshot.data["data de estréia"];

  }
  Map<String, dynamic> toResumedMap(){
    return {
      "title": title,
      "sinopse": sinopse
    };
  }

}

