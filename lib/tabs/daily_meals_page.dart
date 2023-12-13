import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_diet_app/models/meal.dart';
import 'dart:math';

class DailyMealsTab extends StatefulWidget {
  @override
  State<DailyMealsTab> createState() => _DailyMealsTabState();
}

class _DailyMealsTabState extends State<DailyMealsTab> {
  List<Meal> meals = [
    Meal(mealName: "Breakfast", calories: 200, protein: 20, carbs: 15),
  ];

  void addMeal(String name, int calories, int protein, int carbs) {
    Meal newMeal = Meal(
        mealName: name, calories: calories, protein: protein, carbs: carbs);

    setState(() {
      meals.add(newMeal);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Text("Meal page", style: TextStyle(fontSize: 20)),
        /*  ElevatedButton(
            onPressed: () {
              addMealDialog();
            },
            child: Text("Add a Meal"))*/
        Expanded(
            child: ListView.builder(
                itemCount: meals.length,
                itemBuilder: (context, index) {
                  final item = meals[index];
                  return Dismissible(
                      // Each Dismissible must contain a Key. Keys allow Flutter to
                      // uniquely identify widgets.
                      key: ValueKey<Meal>(meals[index]),
                      // Provide a function that tells the app
                      // what to do after an item has been swiped away.
                      onDismissed: (direction) {
                        // Remove the item from the data source.
                        setState(() {
                          meals.removeAt(index);
                        });

                        // Then show a snackbar.
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Meal Has been deleted!')));
                      },
                      child: ListTile(
                        title: Text(
                          "${meals[index].mealName}",
                          style: TextStyle(fontSize: 20),
                        ),
                        subtitle: Text(
                            "Calories: ${meals[index].calories}, Protein: ${meals[index].protein}, Carbs: ${meals[index].carbs}"),
                      ));
                })),
        ElevatedButton(
            onPressed: () {
              addMealDialog();
            },
            child: Text("Add a Meal"))
      ],
    ));
  }

  Future<void> addMealDialog() async {
    String name = '';
    int calories = 0;
    int carbs = 0;
    int protein = 0;

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add a Meal'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextField(
                  onChanged: (value) {
                    name = value;
                  },
                  decoration: InputDecoration(labelText: 'Meal Name'),
                ),
                TextField(
                  onChanged: (value) {
                    calories = int.tryParse(value) ?? 0;
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Calories'),
                ),
                TextField(
                  onChanged: (value) {
                    protein = int.tryParse(value) ?? 0;
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Protein'),
                ),
                TextField(
                  onChanged: (value) {
                    carbs = int.tryParse(value) ?? 0;
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: 'Carbs'),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              child: Text('Cancel 😢'),
            ),
            TextButton(
              onPressed: () {
                addMeal(name, calories, carbs, protein);
                GoRouter.of(context).pop();
              },
              child: Text('Add Meal 😋'),
            ),
          ],
        );
      },
    );
  }
}
