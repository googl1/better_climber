import './exercise.dart';

class Week {
  int num_ex;
  List<Exercise> exercises;

  @override
  Week (List<Exercise> ex) {
    this.num_ex = ex.length;
    this.exercises = ex;
  }
}