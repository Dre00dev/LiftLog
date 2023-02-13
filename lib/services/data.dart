import 'package:fitness/services/models.dart';
import 'package:flutter/foundation.dart';

class WorkoutData extends ChangeNotifier{
  
  /*
    - This will be an overall list containing all the workouts.
    - Each Workout will have a name, and list of exercises.
      -made changenotifier make sure changeNotifier notfies listeners 


  */

  //default workout for new install
  List<Workout>workoutList=[
    //default workout object
    Workout(
      name: 'Full Body',
      exercises: [
        Exercise(
          name: 'Bench Press',
          sets: '4',
          reps: '10',
          weight: '25',
        ),
      ],
    ),
  ];
  //get list of workouts
  List<Workout> getWorkoutList(){
    return workoutList;
  }
  //add a workout
  void addWorkout(String name){  //adds workout with a name and passes blank list of exercises for later
    workoutList.add(
      Workout(
        name: name, 
        exercises: []
        )
      );
    notifyListeners();
  }
  //add exercise to a workout
  void addExercise(String workoutName, String exerciseName, String sets, String reps, String weight){
    Workout currentWorkout = getCurrentWorkout(workoutName);  //pass workoutName to getCurrentWorkout function

    currentWorkout.exercises.add(  //goes into the workout and adds an exercise object
      Exercise(
        name: exerciseName,
        sets: sets,
        reps: reps,
        weight: weight,
      ),
    );
    notifyListeners();
  }
  //get the current workout
  Workout getCurrentWorkout(String workoutName){
    Workout currentWorkout = workoutList.firstWhere((workout) => workout.name == workoutName);  //finds the workout in the list
  
    return currentWorkout;
  }

  //get the current exercise
  Exercise getCurrentExercise(String workoutName, String exerciseName){
    Workout currentWorkout = getCurrentWorkout(workoutName);  //get workout first
    Exercise currentExercise = currentWorkout.exercises.firstWhere((exercise) => exercise.name == exerciseName); 

    return currentExercise;
  }

  //check off exercise
  void toggleExercise(String workoutName, String exerciseName){
    Exercise currentExercise = getCurrentExercise(workoutName, exerciseName);

    currentExercise.isDone = !currentExercise.isDone;  //does the opposite basically toggles on and off
    notifyListeners();
  }


  //get length of workout
  int numExercisesInWorkout(String workoutName){
    Workout currentWorkout = getCurrentWorkout(workoutName);

    return currentWorkout.exercises.length; 
  }
}
