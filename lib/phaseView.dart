import './exTile.dart';
import 'package:flutter/material.dart';
import './help.dart';
import './profile.dart';
import './phase.dart';

class PhaseViewState extends State<PhaseView> {
  Help help;
  Profile profile;
  List<Phase> phases;
  Widget card;
  int week;

  @override
  PhaseViewState(Profile profile) {
    this.profile = profile;
    help = new Help();
    phases = new List();
    phases.add(new Phase(profile.num_phase));
    this.week = profile.week;
  }

  void change() {
    setState(() {
      Navigator.push(
        context,
        new MaterialPageRoute(builder: (context) => new PhaseView(this.profile)),
      );
    });
  }

  Card buildWeek() {
    List<Widget> children = new List();
    if (profile.isFirstTime) {
      children = [new AlertDialog(
        title: new Text('Hi!'),
        content: new SingleChildScrollView(
          child: new ListBody(
            children: <Widget>[
              new Text(
                  "This is BetterClimber, a gamified version of Neil Greshams\'s article in Rock & Ice: A one-year-long training plan to become a better climber."),
              new Text(
                  """You can start now with the first week of training."""),
            ],
          ),
        ),
        actions: <Widget>[
          new FlatButton(
            child: new Text('Start with phase 1'),
            onPressed: () {
              profile.isFirstTime = false;
              setState(() {
                Navigator.pop;
              });
            },
          ),
        ],
      )];
    }
    else {
      for (int i = 0; i < profile.phase.weeks[profile.week - 1].num_ex; i++) {
        children.add(new ExTile(profile,
            phases[this.profile.num_phase - 1].weeks[profile.week - 1]
                .exercises[i],
            context, true, profile.week, this));
        children.add(new Divider());
      }

      if (this.week < profile.week)
        children.add(new FlatButton(
          child: new Text('Continue with next week.'),
          onPressed: () {
            this.change();
          },
        ));
    }

    return new Card(
      child: new Column(
        children: children
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("${phases[profile.num_phase - 1].title}\nWeek ${profile.week}/${profile.phase.num_weeks}"),
        ),
        body: new Container(
          child:  this.buildWeek()
        )
    );
  }
}

class PhaseView extends StatefulWidget {
  Profile profile;

  @override
  PhaseView(Profile profile) {
    this.profile = profile;
  }

  @override
  PhaseViewState createState() => new PhaseViewState(profile);
}
