import 'package:bmi_calc/Second_Page.dart';
import 'package:flutter/material.dart';
// import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

double height = 150;
int san = 0;

int weight = 30;
int age = 18;
int select = 0;

class sandar {
  static double sum = 0;
}

class _MyHomePageState extends State<MyHomePage> {
  Widget calculate(
    Color co,
    String suilom,
    double dlina,
    IconData ikon,
    int index,
  ) {
    return InkWell(
      onTap: () {
        setState(() {
          select = index;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: co,
          borderRadius: BorderRadius.circular(10),
        ),
        width: 150,
        height: dlina,
        child: Column(
          children: [
            Icon(
              ikon,
              size: 95,
              color: Colors.white,
            ),
            Text(
              suilom,
              style: TextStyle(fontSize: 25, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget contr(
    String text,
    Color colors,
    double breite,
    String san,
    IconData plus,
    IconData minus,
    Function() funktion,
    Function() funktion1,
  ) {
    return Container(
      height: 177,
      width: breite,
      decoration: BoxDecoration(
        color: colors,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
          Text(
            san,
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    funktion();
                  });
                },
                child: Icon(Icons.add_circle, color: Colors.white, size: 55),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    funktion1();
                  });
                },
                child: Icon(Icons.remove_circle, color: Colors.white, size: 55),
              ),
            ],
          )
        ],
      ),
    );
  }

  result() {
    setState(() {
      sandar.sum = weight / ((height / 100) * (height / 100));
      print("${sandar.sum}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(75, 155, 39, 176),
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text('BMI CAlCULATOR'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  select == 1
                      ? calculate(Colors.green, 'Male', 177, Icons.male, 1)
                      : calculate(Color.fromARGB(75, 155, 39, 176), 'Male', 177,
                          Icons.male, 1),
                ],
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  select == 2
                      ? calculate(Colors.green, 'Female', 177, Icons.female, 2)
                      : calculate(Color.fromARGB(75, 155, 39, 176), 'Female',
                          177, Icons.female, 2),
                ],
              )
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(48, 155, 39, 176),
              borderRadius: BorderRadius.circular(10),
            ),
            height: 176,
            width: 335,
            child: Column(
              children: [
                Text(
                  'HEIGHT',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
                Text(
                  '$height',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
                Slider(
                  value: height,
                  min: 150,
                  max: 195,
                  divisions: 50,
                  onChanged: (bas) {
                    setState(() {
                      height = bas;
                    });
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              contr('WEIGHT', Color.fromARGB(48, 155, 39, 176), 150, "$weight",
                  Icons.add_circle, Icons.remove_circle, () {
                weight++;
              }, () {
                weight--;
                if (weight <= 30) {
                  weight = 30;
                }
              }),
              SizedBox(
                width: 20,
              ),
              contr(
                'AGE',
                Color.fromARGB(48, 155, 39, 176),
                150,
                "$age",
                Icons.add_circle,
                Icons.remove_circle,
                () {
                  age++;
                },
                () {
                  age--;
                  if (age <= 18) {
                    age = 18;
                  }
                },
              )
            ],
          ),
          SizedBox(
            height: 25,
          ),
          InkWell(
            onTap: () {
              setState(() {
                result();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyWidget(),
                    ));
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(10),
              ),
              height: 73,
              width: 375,
              child: Center(
                child: Text(
                  'CALCULATOR',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
