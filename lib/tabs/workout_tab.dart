import 'package:flutter/material.dart';
import 'package:my_diet_app/models/workout.dart';

class WorkoutTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Center(child: Text("Workout Page!", style: TextStyle(fontSize: 20))),
          Workout(workoutName: "Running 🏃"),
          Workout(workoutName: "Swiming 🏊"),
          Workout(workoutName: "Cycling 🚴‍♂️")
        ],
      ),
    );
  }
}
