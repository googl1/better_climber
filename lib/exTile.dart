import 'package:flutter/material.dart';
import './profile.dart';
import './exercise.dart';

class ExTile extends StatefulWidget {
  Exercise exercise;
  BuildContext context;
  Profile profile;
  bool active;
  int week;

  @override
  _ExTileState createState() =>
      new _ExTileState(this.profile, this.exercise, this.context, this.active, this.week);

  @override
  ExTile(Profile profile, Exercise exercise,
      BuildContext context, bool active, int week) {
    this.profile = profile;
    this.context = context;
    this.exercise = exercise;
    this.active = active;
    this.week = week;
  }
}

class _ExTileState extends State<ExTile> {
  BuildContext _context;  // FIXME: really needed?
  Profile profile;        // contains info on how much of what is done and has to be done
  Exercise exercise;            // data on the exercise
  bool active;
  int week;

  @override
  _ExTileState(Profile profile, Exercise exercise, BuildContext context, bool active, int week) {
    this.profile = profile;
    this._context = context;
    this.exercise = exercise;
    this.active = active;
    this.week = week;

    if (this.profile.exercise[exercise.number] >= exercise.total)
      this.active = false;
  }

  void _handleTap() {
      setState(() {
        profile.exDone(exercise.number);
        if (this.profile.exercise[exercise.number] >= exercise.total)
          profile.weekDone();
      });

  }

  void _showHelp() {
      showDialog(
          context: this.context,
          child: new SimpleDialog(
              title: new Text(this.exercise.helpTitle),
              contentPadding: new EdgeInsets.all(32.0),
              children: [
                new Text(this.exercise.help),
              ]));
  }

  @override
  Widget build(BuildContext context) {
    int num_done;
    if (this.active)
      num_done = this.profile.exercise[exercise.number];
    else
      num_done = 0;
    Widget leading;

    if (this.week != profile.week) {
      leading = new Icon(Icons.block);
      this.active = false;
    }
    else if (this.profile.exercise[exercise.number] >= exercise.total) {
      leading = new Icon(Icons.check, color: Colors.green);
      this.active = false;
    }
    else
      leading = new Text(this.profile.exercise[exercise.number].toString() + '/'
          + this.exercise.total.toString());

    return new ListTile(
      title: new Text(this.exercise.name,
          style: new TextStyle(fontWeight: FontWeight.w500)),
      onTap: _handleTap,
      leading: leading,
      trailing: new IconButton(
        icon: new Icon(Icons.help),
        tooltip: 'Details',
        onPressed: _showHelp
      ),

      enabled: this.active,
    );
  }
}
