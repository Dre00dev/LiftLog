//********Packages to be used if we integrate firebase*******
//import 'package:json_annotation/json_annotation.dart';
//This creates the file with the generated code
//part 'models.g.dart';

class Workout{
  String name;
  List <Exercise> exercises;

  Workout({
    this.name = '',
    this.exercises = const [],
  });
}

class Exercise{
  String name;
  String sets;
  String reps;
  String weight;
  bool isDone;

  Exercise({
    this.name = '',
    this.sets = '',
    this.reps = '',
    this.weight = '',
    this.isDone = false,
  });
}

class Report {
   String uid;
   String gender;
   int weight;
   int height;
   double bmi;

   Report({
    this.uid = '', 
    this.gender = '', 
    this.weight = 0,
    this.height = 0,
    this.bmi = 0.00,
    });
}