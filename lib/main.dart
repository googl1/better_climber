import 'package:flutter/material.dart';
import './profile.dart';
import './phases.dart';

Profile profile;

void main() async{
  profile = new Profile();
  await profile.loadProfile();

  runApp(new MaterialApp(
    title: 'BetterClimber',
    home: new Phases(profile),
    theme: new ThemeData(
      primarySwatch: Colors.pink,
    ),
  ));
}