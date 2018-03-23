import 'package:flutter/material.dart';
import './profile.dart';
import './phase.dart';

Profile profile;

void main() async{
  profile = new Profile();
  await profile.loadProfile();

  runApp(new MaterialApp(
    title: 'BetterClimber',
    home: new Phase(profile),
    theme: new ThemeData(
      primarySwatch: Colors.pink,
    ),
  ));
}