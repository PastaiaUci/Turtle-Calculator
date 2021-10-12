import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Models/Turtle.dart';
import 'package:flutter_app/Models/TurtleData.dart';
import 'package:flutter_app/Services/database.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/Services/calculate_status.dart';
class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  double _turtleHeight = 0.0;
  double _turtleWeight = 0.0;
  int turtle_count =0;
  String result = "error";

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Turtle>>.value(

      value: DataBaseService().turtles,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(50, 100, 50, 50),
                  width: 500,
                  height: 250,
                  color: Colors.blue,
                  child: Text("EMYS ORBICULARIS HIBERNATION CALCULATOR",style: TextStyle(color: Colors.white,fontSize: 21,fontWeight: FontWeight.w700),
                  textAlign: TextAlign.center,)
                ),
                Container(height: 30),
                Text("Shell length (cm)",style: TextStyle(color: Colors.grey,fontSize: 20,fontWeight: FontWeight.w800),
                ),
                Container(
                  padding: EdgeInsets.only(left: 16,right: 16),
                  child: Slider(
                    min: 0,
                    max: 100,
                    onChanged: (height){
                     setState(() {
                       _turtleHeight = height;
                     });
                    },
                    value: _turtleHeight,
                    divisions: 100,
                    activeColor: Colors.redAccent,
                    label: "$_turtleHeight",
                  ),
                ),
                Text("$_turtleHeight cm", style: TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.w900),),
                Container(height: 30,),
                Text("Weight before hibernation (g)",style: TextStyle(color: Colors.grey,fontSize: 20,fontWeight: FontWeight.w800),
                ),
                Container(
                  padding: EdgeInsets.only(left: 16,right: 16),
                  child: Slider(
                    min: 0,
                    max: 100,
                    onChanged: (weight){
                      setState(() {
                        _turtleWeight = weight;
                      });
                    },
                    value: _turtleWeight,
                    divisions: 100,
                    activeColor: Colors.redAccent,
                    label: "$_turtleWeight",
                  ),
                ),
                Text("$_turtleWeight g", style: TextStyle(color: Colors.red, fontSize: 18, fontWeight: FontWeight.w900),),
                Container(
                  child: FlatButton.icon(
                       onPressed: () async {
                         setState(() {
                           turtle_count+=1;
                           int greutate = testos(_turtleHeight, _turtleWeight);

                           if (greutate == 0)
                            {
                              result = "UNDERWEIGHT";
                            }
                           if (greutate == 1) {
                             result = "OPTIMAL WEIGHT";
                           }
                           if(greutate == 2) {
                             result = "OVERWEIGHT";
                           }
                         });
                         await DataBaseService(uid: turtle_count.toString()).addData(_turtleHeight,_turtleWeight,result);
                       },
                       icon: Icon(Icons.add_outlined, color: Colors.white,),
                        label: Text("Compute"),
                       textColor: Colors.white,
                      color: Colors.red,
                  ),
                ),
               TurtleData()
            ],
          ),
        ),
      )
      ),
    );
  }
}



