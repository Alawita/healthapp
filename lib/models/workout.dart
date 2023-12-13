import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

class Workout extends StatefulWidget {
  final String workoutName;
  const Workout({Key? key, required this.workoutName}) : super(key: key);

  @override
  _WorkoutState createState() => _WorkoutState();
}

class _WorkoutState extends State<Workout> {
  double progress = 0;
  double progressTimer = 0;

  double roundDouble(double value, int places) {
    num mod = pow(10.0, places);
    return ((value * mod).round().toDouble() / mod);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.workoutName,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 15),
            LinearProgressIndicator(
              value: progress,
              minHeight: 15,
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.lightGreen),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      startWorkout();
                    },
                    child: Text("start")),
                Text("${roundDouble(progressTimer, 1).toString()}/60"),
              ],
            )
          ],
        ),
      ),
    );
  }

  void startWorkout() {
    setState(() {
      progress = 0;
      Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          progress += 1 / 60;
          progressTimer = progress * 60;
          if (progress >= 1) {
            timer.cancel();
          }
        });
      });
    });
  }
}
