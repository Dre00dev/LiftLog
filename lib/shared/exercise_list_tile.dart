import 'package:flutter/material.dart';

class ExerciseTile extends StatelessWidget {
  final String exerciseName;
  final String sets;
  final String reps;
  final String weight;
  final bool isDone;
  void Function (bool?)? isCheckBox;

   ExerciseTile({
    super.key, 
    required this.exerciseName, 
    required this.sets,
    required this.reps,
    required this.weight,
    required this.isDone,
    required this.isCheckBox
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
      child: ListTile(
            title: Text(exerciseName),  //displays list of exercises
            subtitle: Row(
              children: [
                //sets
                Chip(label: Text("$sets sets")),
                //reps
                Chip(label: Text("$reps reps")),
                //weights
                Chip(label: Text("$weight lbs"))
              ],
            ),trailing:Checkbox(
              value: isDone,
              onChanged: ((value) => isCheckBox!(value))  // added ! for null check
             ) ,
          ),
    );
  }
}