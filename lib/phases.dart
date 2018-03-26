import './exTile.dart';
import 'package:flutter/material.dart';
import './help.dart';
import './profile.dart';
import './phase.dart';

class _PhaseState extends State<Phases> {
  Help help;
  Profile profile;
  List<Phase> phases;

  @override
  _PhaseState(Profile profile) {
    this.profile = profile;
    help = new Help();
    phases = new List();
    phases.add(new Phase(profile.phase));
  }

  firstStart(BuildContext context) {
    showDialog(
        context: this.context,
        child: new AlertDialog(
          title: new Text('Hi!'),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: <Widget>[
                new Text("""This is BetterClimber, a gamified version of
Neil Greshams\'s article in Rock & Ice:
A one-year-long training plan to become a better climber."""),
                new Text(
                    """You can start now with the first week of training."""),
              ],
            ),
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text('Start with phase 1'),
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new Phases(profile)),
                );
              },
            ),
          ],
        ));
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(phases[0].title),
      ),
      body: new Builder(
          // Create an inner BuildContext so that the onPressed methods
          // can refer to the Scaffold with Scaffold.of().
          builder: (BuildContext context) {
            return new ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  if (profile.isFirstTime) {
                    index--;
                    if (index == -1) {
                      return new AlertDialog(
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
                              Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (context) => new Phases(profile)),
                              );
                            },
                          ),
                        ],
                      );
                    }
                  }

                  if (index < this.phases[0].num_weeks) {
                    bool active = false;
                    if (profile.week == index + 1) {
                      active = true;
                      print(index);
                    }
                    return new SizedBox(
                      child: new Card(
                        child: new Column(
                          children: [
                            new ExTile(profile, phases[0].weeks[index + profile.week - 1].exercises[0],
                                context, active, index+1),
                            new Divider(),
                            new ExTile(profile, phases[0].weeks[index + profile.week - 1].exercises[1],
                                context, active, index+1),
                            new Divider(),
                            new ExTile(profile, phases[0].weeks[index + profile.week - 1].exercises[2],
                                context, active, index+1),
                            new Divider(),
                            new ExTile(profile, phases[0].weeks[index + profile.week - 1].exercises[3],
                                context, active, index+1),
                          ],
                        ),
                      ),
                    );
                  }
                }
            );
          }
      ),
    );
  }
}

            /*
            new SizedBox(
              child: new Card(
                child: new Column(
                  children: [
                    new ExTile(profile, phases[0].weeks[1].exercises[0],
                        context, false),
                    new Divider(),
                    new ExTile(profile, phases[0].weeks[1].exercises[1],
                        context, false),
                    new Divider(),
                    new ExTile(profile, phases[0].weeks[1].exercises[2],
                        context, false),
                    new Divider(),
                    new ExTile(profile, phases[0].weeks[1].exercises[3],
                        context, false),
                  ],
                ),
              ),
            ),*/


class Phases extends StatefulWidget {
  Profile profile;

  @override
  Phases(Profile profile) {
    this.profile = profile;
  }

  @override
  _PhaseState createState() => new _PhaseState(profile);
}
