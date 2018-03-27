import 'package:flutter/material.dart';
import './profile.dart';
import './phaseView.dart';
import './phase.dart';

Profile profile;

void main() async{
  profile = new Profile();
  await profile.loadProfile();

  runApp(new MaterialApp(
    title: 'BetterClimber',
    home: new PhaseView(profile),
    theme: new ThemeData(
      primarySwatch: Colors.pink,
    ),
  ));
}