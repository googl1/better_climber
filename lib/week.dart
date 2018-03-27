import './exercise.dart';

class Week {
  int num_ex;
  List<Exercise> exercises;
  var todo;

  @override
  Week (List<Exercise> ex) {
    this.num_ex = ex.length;
    this.exercises = ex;
    this.todo = new List(exercises.length);

    for (var i = 0; i < exercises.length; i++) {
      todo[i] = exercises[i].total;
    }
  }
}