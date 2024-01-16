// ignore: file_names
import 'package:flutter/material.dart';
import 'package:bmi_calc/main.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

String al = sandar.sum.toStringAsFixed(2);

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(75, 155, 39, 176),
      appBar: AppBar(
        title: Text('Ден соолук индекси(BMI)'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            ' RESULT',
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
          Text(
            '$al',
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
          Container(
            height: 35,
            width: 400,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.pink),
          )
        ],
      ),
    );
  }
}
