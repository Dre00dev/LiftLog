import 'package:fitness/shared/exercise_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:fitness/services/data.dart';

class WorkoutScreen extends StatefulWidget {
  final String workoutName;
  const WorkoutScreen({super.key, required this.workoutName});

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {

  //text controllers
  final exerciseNameController = TextEditingController();
  final setsController = TextEditingController();
  final repsController = TextEditingController();
  final weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    return Consumer<WorkoutData>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          title: Text(widget.workoutName),  //displays workout title
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => createNewExercise,
          child: Icon(Icons.add)
        ),
        body: ListView.builder(
          itemCount: value.numExercisesInWorkout(widget.workoutName),
          itemBuilder: (context, index) => ExerciseTile(
            exerciseName: value.getCurrentWorkout(widget.workoutName).exercises[index].name, 
            sets: value.getCurrentWorkout(widget.workoutName).exercises[index].sets, 
            reps: value.getCurrentWorkout(widget.workoutName).exercises[index].reps, 
            weight: value.getCurrentWorkout(widget.workoutName).exercises[index].weight, 
            isDone: value.getCurrentWorkout(widget.workoutName).exercises[index].isDone,
            isCheckBox: (val) => isCheckBox(
              widget.workoutName, 
              value.getCurrentWorkout(widget.workoutName).exercises[index].name
              ),
            ),
        ),
      ),
    );
  }
//when the checkbox is tapped 
  void isCheckBox(String workoutName, String exerciseName){
    Provider.of<WorkoutData>(context,listen: false).toggleExercise(workoutName, exerciseName);
    //access workout data's toggle exercise method
  }
  void createNewExercise(){
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Enter New Exercise'),
        content: Column(
          children: [
            //exercise name
            TextField(
              controller: exerciseNameController,
            ),
            //sets
            TextField(
              controller: setsController,
            ),
            //reps 
            TextField(
              controller: repsController,
            ),
            //weight
            TextField(
              controller: weightController,
            )
          ],
        ),
        actions: [
          //cancel button
          MaterialButton(
          onPressed: cancel,
          child: Text('Cancel'),
          ),
          //save button
          MaterialButton(
           onPressed: save,
           child: Text('Save'),
          ),
        ],
      ),
    );
  }
  void cancel(){
  //pops dialog box 
  Navigator.pop(context);
  //clears the controller
  clear();
}
//save method
void save(){
  //add workout name to workout data list
  Provider.of<WorkoutData>(context, listen: false).addWorkout(exerciseNameController.text);
  //pops dialog box
  Navigator.pop(context);
  //clears the controller
  clear();
}

void clear(){
  exerciseNameController.clear();
  setsController.clear();
  repsController.clear();
  weightController.clear();
}
}