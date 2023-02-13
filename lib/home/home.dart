import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:fitness/services/data.dart';
import 'package:fitness/workout/workout.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutData>(
      builder:(context, value, child) => Scaffold(
        appBar: AppBar(
          title: Text('Workout Tracker'),
          ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewWorkout,
          child: const Icon(FontAwesomeIcons.dumbbell),
        ),
    
        body: ListView.builder(
          itemCount: value.getWorkoutList().length,  
          itemBuilder: (context, index) => ListTile(
            title: Text(value.getWorkoutList()[index].name),// go into the index of the workout list and access just the name.  
            trailing: IconButton(
              icon: const Icon(FontAwesomeIcons.arrowRight),
              onPressed: (() => goToWorkoutPage(value.getWorkoutList()[index].name)),
              ),
          ),
        ),
      )
    );
  }

//text controllers
final newWorkoutNameController = TextEditingController();

void createNewWorkout(){
  showDialog(
    context: context, 
    builder: (context) => AlertDialog(
      title: Text('Create New Workout'),
      content: TextField(
        controller: newWorkoutNameController,  //controller to access user input
      ),
      actions: [
        //cancel button
        MaterialButton(
          onPressed: cancel,
          child: Text('Cancel'),
          ),
        MaterialButton(
          onPressed: save,
          child: Text('Save'),
          ),
      ],
    ),
  );
}
//cancel method
void cancel(){
  //pops dialog box 
  Navigator.pop(context);
  //clears the controller
  newWorkoutNameController.clear();
}
//save method
void save(){
  //add workout name to workout data list
  Provider.of<WorkoutData>(context, listen: false).addWorkout(newWorkoutNameController.text);
  //pops dialog box
  Navigator.pop(context);
  //clears the controller
  newWorkoutNameController.clear();
}

void goToWorkoutPage(String workoutName){
  Navigator.push(context, 
  MaterialPageRoute(
    builder: (context) => WorkoutScreen(
      workoutName: workoutName, //passes workoutname to workout.dart
    ),
  ),
  );
}

}