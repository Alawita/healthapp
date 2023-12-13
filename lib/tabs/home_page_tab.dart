import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';

class HomePageTab extends StatefulWidget {
  @override
  State<HomePageTab> createState() => _HomePageTabState();
}

class _HomePageTabState extends State<HomePageTab> {
  double homeWaterinTake = 0;
  double homeBmi = 0;

  void initState() {
    super.initState();
    // only called once when the page starts.

    readfromShared();
    // setState(() {});
  }

  readfromShared() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();

    setState(() {
      homeBmi = _prefs.getDouble("bmiResulat") ?? 0.0;

      homeWaterinTake = _prefs.getDouble("waterintake") ?? 0;
      print("*****************" +
          homeWaterinTake.toString() +
          "   ****  " +
          homeBmi.toString());
    });
  }

  double roundDouble(double value, int places) {
    num mod = pow(10.0, places);
    return ((value * mod).round().toDouble() / mod);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Text("Home Page", style: TextStyle(fontSize: 20)),
        Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Body Mass Index"),
              SizedBox(
                height: 80,
              ),
              Text("BMI = ${roundDouble(homeBmi, 0)} ")
            ],
          ),
        ),
        Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Water intake 💧"),
              SizedBox(
                height: 80,
              ),
              Container(
                margin: EdgeInsets.only(right: 20),
                child: CircularProgressIndicator(
                  value: homeWaterinTake / 2000,
                  backgroundColor: Colors.grey,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.lightBlue),
                ),
              )
            ],
          ),
        ),
        Card(
          child: Row(
            children: [
              Text("Daily Meals 🍝"),
              SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
        Card(
          child: Row(
            children: [
              Text("Workout Acitvities 🚴‍♂️"),
              SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
