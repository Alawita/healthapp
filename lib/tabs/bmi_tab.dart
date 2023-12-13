import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BmiTab extends StatefulWidget {
  BmiTab({super.key});

  @override
  State<BmiTab> createState() => _BmiTabState();
}

class _BmiTabState extends State<BmiTab> {
  final weightController = TextEditingController();
  final hieghtController = TextEditingController();
  double results = 50;
  String bmi = "";
  double hightSqr = 0;

  Future calcBMI() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();

    hightSqr = (0.01 * (double.parse(hieghtController.text))) *
        (double.parse(hieghtController.text) * 0.01);

    results = double.parse(weightController.text) / hightSqr;
    // pow(double.parse(hieghtController.text), 2);
    print("***************** set result:" + results.toString());
    await _prefs.setDouble("bmiResulat", results);
    return results;
  }

  readfromShared() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    final bmiresults = await _prefs.getDouble("bmiResulat") ?? 0.0;
    setState(() {
      results = bmiresults;
    });
    print("***************** Bmi:" + results.toString());
  }

  @override
  void initState() {
    super.initState();
    // only called once when the page starts.

    readfromShared();
    // setState(() {});
  }

  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Column(
        children: [
          Text(
            "BMI Calculator",
            style: TextStyle(fontSize: 20),
          ),
          Container(
            width: 300,
            margin: EdgeInsets.only(top: 60),
            child: TextField(
                keyboardType: TextInputType.numberWithOptions(),
                controller: weightController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: 'Put your weight here',
                    hintStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(Icons.width_wide))),
          ),
          Container(
            width: 300,
            margin: EdgeInsets.all(30),
            child: TextField(
                keyboardType: TextInputType.numberWithOptions(),
                controller: hieghtController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: 'Put your height here',
                    hintStyle: TextStyle(color: Colors.black),
                    prefixIcon: Icon(Icons.height))),
          ),
          ElevatedButton(
              onPressed: () {
                calcBMI();
                if (results < 16) {
                  setState(() {
                    bmi = "Underwieght";
                    print(results);
                  });
                } else if (results >= 16 && results <= 24) {
                  setState(() {
                    bmi = "Normal";
                  });
                } else if (results > 24 && results <= 30) {
                  setState(() {
                    bmi = "Overweight";
                  });
                } else {
                  setState(() {
                    bmi = 'Obese';
                  });
                }
                FocusScopeNode currentFocus = FocusScope.of(context);

                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
              child: Text("Calculate!")),
          Container(
            margin: EdgeInsets.all(40),
            child: Text(
              "Status: $bmi",
              style: TextStyle(fontSize: 20),
            ),
          )
        ],
      )),
    );
  }
}
