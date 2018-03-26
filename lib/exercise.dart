import './help.dart';

class Exercise {
  int total;
  int number;
  String name;
  String help;
  String helpTitle;
  Help _helpStrings;

  @override
  Exercise(int todo, String name, int number) {
    _helpStrings = new Help();
    this.total = total;
    if (name == "aerobic") {
      this.name = "Aerobic / anaerobic conditioning & flexibility";
      this.helpTitle = "Running, Burpees and Stretching (60min):";
      this.help = _helpStrings.aerobic;
    }
    if (name == "endurance") {
      this.name = "Low-intensity endurance";
      this.helpTitle = "Either lead or bouldering (80min):";
      this.help = _helpStrings.endurance;
    }
    if (name == "volume") {
      this.name = "Bouldering – volume / easy problems";
      this.helpTitle = "Bouldering (80min):";
      this.help = _helpStrings.volume;
    }
    if (name == "antagonists") {
      this.name = "Antagonists & core";
      this.helpTitle = "Strength exercizes (60min):";
      this.help = _helpStrings.antagonists;
    }


    this.total = todo;
    this.number = number;
  }
}