import './week.dart';
import './exercise.dart';

class Phase {
  List<Week> weeks;
  int num_weeks;
  String title;
  int num;

  @override
  Phase(int num) {
    this.num = num;

    if (num == 1) {
      this.title = "Phase 1 - Conditioning";

      this.weeks = new List();

      List<Exercise> week1and2_exercises = new List();
      week1and2_exercises.add(new Exercise(4, "aerobic", 0));
      week1and2_exercises.add(new Exercise(1, "endurance", 1));
      week1and2_exercises.add(new Exercise(1, "volume", 2));
      week1and2_exercises.add(new Exercise(3, "antagonists", 3));

      List<Exercise> week3and4_exercises = new List();
      week3and4_exercises.add(new Exercise(4, "aerobic", 0));
      week3and4_exercises.add(new Exercise(2, "endurance", 1));
      week3and4_exercises.add(new Exercise(1, "volume", 2));
      week3and4_exercises.add(new Exercise(3, "antagonists", 3));

      List<Exercise> week5and6_exercises = new List();
      week5and6_exercises.add(new Exercise(3, "aerobic", 0));
      week5and6_exercises.add(new Exercise(3, "endurance", 1));
      week5and6_exercises.add(new Exercise(1, "volume", 2));
      week5and6_exercises.add(new Exercise(3, "antagonists", 3));

      weeks.add(new Week(week1and2_exercises));
      weeks.add(new Week(week1and2_exercises));
      weeks.add(new Week(week3and4_exercises));
      weeks.add(new Week(week3and4_exercises));
      weeks.add(new Week(week5and6_exercises));
      weeks.add(new Week(week5and6_exercises));

      this.num_weeks = weeks.length;
    }
    if (num > 1) {
      this.title = "Phase 2 - Low-Intensity Endurance";

      this.weeks = new List();

      List<Exercise> week1and2_exercises = new List();
      week1and2_exercises.add(new Exercise(4, "aerobic", 0));
      week1and2_exercises.add(new Exercise(1, "endurance", 1));
      week1and2_exercises.add(new Exercise(1, "volume", 2));
      week1and2_exercises.add(new Exercise(3, "antagonists", 3));

      List<Exercise> week3and4_exercises = new List();
      week3and4_exercises.add(new Exercise(4, "aerobic", 0));
      week3and4_exercises.add(new Exercise(2, "endurance", 1));
      week3and4_exercises.add(new Exercise(1, "volume", 2));
      week3and4_exercises.add(new Exercise(3, "antagonists", 3));

      List<Exercise> week5and6_exercises = new List();
      week5and6_exercises.add(new Exercise(3, "aerobic", 0));
      week5and6_exercises.add(new Exercise(3, "endurance", 1));
      week5and6_exercises.add(new Exercise(1, "volume", 2));
      week5and6_exercises.add(new Exercise(3, "antagonists", 3));

      weeks.add(new Week(week1and2_exercises));
      weeks.add(new Week(week1and2_exercises));
      weeks.add(new Week(week3and4_exercises));
      weeks.add(new Week(week3and4_exercises));
      weeks.add(new Week(week5and6_exercises));
      weeks.add(new Week(week5and6_exercises));

      this.num_weeks = weeks.length;
    }
  }
}