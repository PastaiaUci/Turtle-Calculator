import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/Models/Turtle.dart';

class DataBaseService{
   final String uid;

   DataBaseService({this.uid});

  //collection reference
  final CollectionReference turtleCollecion  = FirebaseFirestore.instance.collection("turtles");

  Future addData(double height,double weight,String result) async{
    return  await  turtleCollecion.doc(uid).set({
      'height':height,
      'weight':weight,
      'result':result
    });
  }


  //returns a list of turtles with the input in the tabel
   List<Turtle> turtleListFromSnapshot(QuerySnapshot snapshot){
     return snapshot.docs.map((doc){
       return Turtle(
         length:doc.get('height') ?? 0,
         weight:doc.get('weight') ?? 0,
         result:doc.get('result') ?? '',
       );
     }).toList();
   }

  // a stream that returns list of Turtles of a given moment in time
   Stream< List<Turtle>> get turtles{
     return turtleCollecion.snapshots().map(
         turtleListFromSnapshot);
   }


}