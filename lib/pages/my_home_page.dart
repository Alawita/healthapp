import 'package:flutter/material.dart';
import 'package:my_diet_app/tabs/bmi_tab.dart';
import 'package:my_diet_app/tabs/daily_meals_page.dart';
import 'package:my_diet_app/tabs/home_page_tab.dart';
import 'package:my_diet_app/tabs/water_intake_tab.dart';
import 'package:my_diet_app/tabs/workout_tab.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "My Health",
              style: TextStyle(color: Colors.black),
            ),
          ),
          body: Column(
            children: [
              TabBar(tabs: [
                Tab(
                  child: Text(
                    "🏠",
                    style: TextStyle(fontSize: 26),
                  ),

                  // icon: Icon(Icons.home),
                ),
                Tab(
                    child: Text(
                  "🏋️‍♂️",
                  style: TextStyle(fontSize: 26),
                )
                    //text: "🏋️‍♂️",
                    // icon: Icon(Icons.local_activity),
                    ),
                Tab(
                    child: Text(
                  "💧",
                  style: TextStyle(fontSize: 26),
                )
                    //text: "🥛",
                    // icon: Icon(Icons.water),
                    ),
                Tab(
                    child: Text(
                  "🍴",
                  style: TextStyle(fontSize: 26),
                )
                    //text: "🍴",
                    // icon: Icon(Icons.wallet),
                    ),
                Tab(
                    child: Text(
                  "💪",
                  style: TextStyle(fontSize: 26),
                )
                    //text: "💪",
                    // icon: Icon(Icons.timer),
                    )
              ]),
              Expanded(
                child: TabBarView(children: [
                  HomePageTab(),
                  BmiTab(),
                  WaterIntakeTab(),
                  DailyMealsTab(),
                  WorkoutTab()
                ]),
              )
            ],
          ),
        ));
  }
}
