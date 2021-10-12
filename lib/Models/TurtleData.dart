import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Turtle.dart';

class TurtleData extends StatefulWidget {
  @override
  _TurtleDataState createState() => _TurtleDataState();
}

class _TurtleDataState extends State<TurtleData> {
  @override
  Widget build(BuildContext context) {
    final turtles = Provider.of<List<Turtle>>(context);
    return  DataTable(
      columns:
      [
        DataColumn(label: Text("Length")),
        DataColumn(label: Text("Weight")),
        DataColumn(label: Text("Result")),
      ],
      rows:turtles // Loops through dataColumnText, each iteration assigning the value to element
          .map(
        ((element) => DataRow(
          cells: <DataCell>[
            DataCell(Text(element.length.toString())),
            DataCell(Text(element.weight.toString())),
            DataCell(Text(element.result)),

          ],
        )),
      )
          .toList(),

    );
  }
}
