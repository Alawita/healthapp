import 'package:flutter/material.dart';
import 'package:my_diet_app/models/water.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WaterIntakeTab extends StatefulWidget {
  @override
  State<WaterIntakeTab> createState() => _WaterIntakeTabState();
}

class _WaterIntakeTabState extends State<WaterIntakeTab> {
  Water water1 = Water();
  /* wtrIntake() {
    print("TEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEST");
    if (waterintake < 500) {
      setState(() {
        bottle = "water1.png";
        bottleDone = "You need to drink more water!";
      });
    } else if (waterintake >= 500 && waterintake < 1000) {
      setState(() {
        bottle = "water2.png";

        bottleDone = "You're getting started!";
      });
    } else if (waterintake >= 1000 && waterintake < 2000) {
      setState(() {
        bottle = "water3.png";
        bottleDone = "Half way done!";
      });
    } else {
      setState(() {
        bottle = "water4.png";
        bottleDone = "Congrats your water intake is perfect today!";
      });
    }
  }
*/
  @override
  void initState() {
    super.initState();
    // only called once when the page starts.

    readfromShared();
    // setState(() {});
  }

  readfromShared() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    setState(() {
      water1.waterintake = _prefs.getDouble("waterintake") ?? 0;
      print("*****************" + water1.waterintake.toString());
    });
    water1.wtrIntake();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Center(
              child: Text("Water intake Page", style: TextStyle(fontSize: 20))),
          Container(
              margin: EdgeInsets.all(100),
              width: 200,
              height: 200,
              child: FittedBox(
                  child: Image.asset("assets/images/${water1.bottle}"))),
          Text("${water1.bottleDone}"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () async {
                    final SharedPreferences _prefs =
                        await SharedPreferences.getInstance();
                    setState(() {
                      water1.waterintake = water1.waterintake + 250;
                    });
                    _prefs.setDouble("waterintake", water1.waterintake);
                    water1.wtrIntake();
                  },
                  child: Text(" Add 250mL ")),
              ElevatedButton(
                  onPressed: () async {
                    final SharedPreferences _prefs =
                        await SharedPreferences.getInstance();
                    setState(() {
                      water1.waterintake = water1.waterintake + 500;
                    });
                    _prefs.setDouble("waterintake", water1.waterintake);
                    water1.wtrIntake();
                  },
                  child: Text("Add 500mL")),
              ElevatedButton(
                  onPressed: () async {
                    final SharedPreferences _prefs =
                        await SharedPreferences.getInstance();
                    setState(() {
                      water1.waterintake = water1.waterintake + 1000;
                    });
                    _prefs.setDouble("waterintake", water1.waterintake);
                    water1.wtrIntake();
                  },
                  child: Text("   Add 1L   ")),
            ],
          ),
          TextButton(
              onPressed: () async {
                final SharedPreferences _prefs =
                    await SharedPreferences.getInstance();
                setState(() {
                  water1.waterintake = 0;
                });
                _prefs.setDouble("waterintake", water1.waterintake);
                water1.wtrIntake();
              },
              child: Text("Reset!")),
        ],
      ),
    );
  }
}
