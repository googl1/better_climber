import './exTile.dart';
import 'package:flutter/material.dart';
import './help.dart';
import './profile.dart';

class _PhaseState extends State<Phase> {
  Help help;
  Profile profile;

  @override
  _PhaseState(Profile profile)
  {
    this.profile = profile;
    help = new Help();
  }

  AlertDialog firstStart(BuildContext context) {
    return new AlertDialog(
      title: new Text('Hi!'),
      content: new SingleChildScrollView(
        child: new ListBody(
          children: <Widget>[
            new Text("""This is BetterClimber, a gamified version of
Neil Greshams\'s article in Rock & Ice:
A one-year-long training plan to become a better climber."""),
            new Text("""You can start now with the first week of training."""),
          ],
        ),
      ),
      actions: <Widget>[
        new FlatButton(
          child: new Text('Start with phase 1'),
          onPressed: () {
            Navigator.push(
              context,
              new MaterialPageRoute(builder: (context) => new Phase(profile)),
            );
          },
        ),
      ],
    );
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Phase 1 - Conditioning"),
      ),
      body: new Builder(
        // Create an inner BuildContext so that the onPressed methods
        // can refer to the Scaffold with Scaffold.of().
          builder: (BuildContext context) {
            return new Column(
              children: [
                new SizedBox(
                  child: new Card(
                    child: new Column(
                      children: [
                        new ExTile(profile, 0, "Aerobic / anaerobic conditioning & flexibility",
                            "Running, Burpees and Stretching (60min):",
                            help.text1, 2, context),
                        new Divider(),
                        new ExTile(profile, 1, "Low-intensity endurance",
                            "Either lead or bouldering (80min)", help.text2, 2, context),
                        new Divider(),
                        new ExTile(profile, 2, "Bouldering – volume / easy problems:",
                            "Bouldering (80min):", help.text3, 2,
                            context),
                        new Divider(),
                        new ExTile(profile, 3, "Antagonists & core",
                            "Strength exercizes (60min):", help.text4, 2, context),
                      ],
                    ),
                  ),
                ),
                new Opacity(
                  opacity: 0.2,
                  child: new SizedBox(
                    child: new Card(
                      child: new Column(
                        children: [
                          new ExTile(profile, 0, "Aerobic / anaerobic conditioning & flexibility",
                              "Running, Burpees and Stretching (60min):",
                              help.text1, 2, context),
                          new Divider(),
                          new ExTile(profile, 1, "Low-intensity endurance",
                              "Either lead or bouldering (80min)", help.text2, 2, context),
                          new Divider(),
                          new ExTile(profile, 2, "Bouldering – volume / easy problems:",
                              "Bouldering (80min):", help.text3, 2,
                              context),
                          new Divider(),
                          new ExTile(profile, 3, "Antagonists & core",
                              "Strength exercizes (60min):", help.text4, 2, context),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
      ),
    );
  }
}

class Phase extends StatefulWidget {
  Profile profile;

  @override
  Phase(Profile profile) {
    this.profile = profile;
  }

  @override
  _PhaseState createState() => new _PhaseState(profile);
}