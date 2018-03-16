import 'package:flutter/material.dart';

String helpText1 = """a) Run [ 30 minutes ]

Running is preferable to cycling in order to avoid bulking up the leg muscles. Go at a slow steady pace to warm-up for the first 5 minutes. Then do 5 intervals of 1 min. on at 90 to 95 percent effort followed by 1 min. slow jog to recover. Then run at a steady pace to finish. Each session make the intervals 10 seconds longer, until eventually you are doing 2 mins. on / 1 min. off x 5, then 5 mins. to warm down.

b) Burpee [ 10 minutes ] 
x 8 (on 1st session). 1 min. rest. Repeat x 4.
                          
Do 1 more rep per set each session (i.e., by session 10 you’ll be doing 18 reps per set).

c) Flexibility [ 15 minutes ]
                          
Hold stretches for 20 seconds, release for 10 seconds, then repeat again for 20 seconds.
                          
1. Hamstrings
                          
2. Thigh / quadriceps

3. Calf

4. Groin

5. Lats

6. Shoulders

7. Chest

8. Forearms (flexors & extensors)""";

String helpText2 = """You have two options: one for the bouldering wall and one for the lead wall. Don’t do both in one session! Warm up first.

a) Routes: 4 x 4s

Select four different routes of the same grade that you can climb consecutively. The grades should be at least two notches below your onsight grade for beginner/intermediates and four below for advanced/elite.

Lower off and move to the next route as quickly as possible. Do this four times with rests equal to climbing time. Pick wall angles based on abilities:

Beginner / Low Intermediate: Vertical

Intermediate: 5- to 10-degrees overhanging

Advanced: 10- to 20-degrees overhanging

Elite: 20- to 30-degrees overhanging

b) Bouldering Wall: Random climbing [ 10 minutes on, 10 minutes off x 4 ]

If you don’t have a belayer, find an easy and quiet area of the bouldering wall. Warm up first then climb around, selecting holds at random for 10 minutes. Go up, down and diagonally as well as traversing. Try linking color-coded problems, provided they are easy enough. Aim for a moderate and continuous level of pump. If you get too pumped, then find a resting position and work at recovering before continuing.

Remember that injuries can still strike at any time, so it’s vital to warm up and cool down, as well as to listen to your body and adjust the workload if you’re not recovering.

You don’t need to be a slave to the plan. It’s fine to swap sessions around and substitute training indoors with climbing outside at any opportunity.""";

String helpText3 = """Climb problems in ascending/descending grade order. Rest 1 minute between problems at first two levels. Rest 2 minutes between harder grades. Aim to do one more problem at each grade with each session.

[ Beginner / Low intermediate ] 5 x V0;  5 x V1;  5 x V2;  5 x V1;  5 x VO

[ Intermediate ] 4 x V0; 4 x V1; 4 x V2;  4 x V3; 4 x V4; 4 x V3 ;4 x V2; 4 x V1

[ Advanced ] 4 x V1; 4 x V2; 4 x V3; 4 x V4;  4 x V5; 4 x V4; 4 x V3; 4 x V2

[ Elite ] 3 x V2; 3 x V3; 3 x V4; 3 x V5; 3 x V6; 3 x V7; 3 x V6; 3 x V5; 3 x V4; 3 x V3; 3 x V2""";

String helpText4 = """a) Antagonists

Do 3 sets of 20 reps of the following exercises with 2 minutes of rest between sets. Don’t go to failure (or, optional, go to failure on last set).

1. Push-ups (kneeling if required)

2. Reverse wrist curls [Use a weight that you can handle comfortably for 3 sets of 20 reps.] 

3. Finger extensions (with rubber band)

b) Core

1. Extreme plank [ 10 reps x 3 sets with 2 minutes rest ]

Do an extra rep each session.

2. Iron cross [ 10 reps x 3 sets with 2 min. rest ] – As extreme plank but spread arms/legs wide

Do an extra rep each session.

3. Leg paddles [ 50 reps x 3 with 2 mins. rest ]

Lie on your back in a half sit-up position. Hands on temples, crunch-up to mid-way. Stretch legs out straight in front, hold feet just above the ground and paddle up and down.

Do 5 additional reps each session.""";

void main() {
  runApp(new MaterialApp(
    title: 'BetterClimber',
    home: new HomeScreen(),
    theme: new ThemeData(
      primarySwatch: Colors.pink,
    ),
  ));
}

class Progress {
  int phase;
  int week;
  var exercize;

  Progress() {
    phase = 0;
    week = 0;
    exercize = [0,0,0,0,0];
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('BetterClimber'),
      ),
      body: new Center(
        child: new AlertDialog(
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
                  new MaterialPageRoute(builder: (context) => new Phase1()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Phase1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ListTile buildTile(String label, String helpTitle, String help,
        int n, int of, BuildContext context) {
      Color color = Theme.of(context).primaryColor;

      return new ListTile(
        title: new Text(label,
          style: new TextStyle(fontWeight: FontWeight.w500)),
        leading: new Text(n.toString() + '/' + of.toString()
        ),
        trailing: new IconButton(
          icon: new Icon(Icons.help),
          tooltip: 'Details',
          onPressed: () {
            showDialog(context: context, child: new SimpleDialog(
              title: new Text(helpTitle),
              contentPadding: new EdgeInsets.all(32.0),
              children: [
                new Text(help),
              ]
            ));
          },
        ),
      );
    }


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
                      buildTile("Aerobic / anaerobic conditioning & flexibility",
                        "Running, Burpees and Stretching (60min):",
                        helpText1, 1, 2, context),
                      new Divider(),
                      buildTile("Low-intensity endurance",
                          "Either lead or bouldering (80min)", helpText2, 1, 2, context),
                      new Divider(),
                      buildTile("Bouldering – volume / easy problems:",
                          "Bouldering (80min):", helpText3, 1, 2,
                        context),
                      new Divider(),
                      buildTile("Antagonists & core",
                          "Strength exercizes (60min):", helpText4, 1, 2, context),
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
                        buildTile("Aerobic / anaerobic conditioning & flexibility",
                            "Running, Burpees and Stretching (60min):",
                            helpText1, 1, 2, context),
                        new Divider(),
                        buildTile("Low-intensity endurance",
                            "Either lead or bouldering (80min)", helpText2, 1, 2, context),
                        new Divider(),
                        buildTile("Bouldering – volume / easy problems:",
                            "Bouldering (80min):", helpText3, 1, 2,
                            context),
                        new Divider(),
                        buildTile("Antagonists & core",
                            "Strength exercizes (60min):", helpText4, 1, 2, context),
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