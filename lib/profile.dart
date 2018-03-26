import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';
import 'package:flutter/material.dart';

class Profile {
  int phase;
  int week;
  var exercise;
  bool isFirstTime;
  int exLen;

  loadProfile() async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    this.exercise = [0,0,0,0];

    this.isFirstTime = await prefs.getBool('isFirstTime');
    this.isFirstTime = true;

    if (isFirstTime == null)
      isFirstTime = true;
    if (isFirstTime) {
      this.phase = 1;
      this.week = 1;
      this.exLen = 4;
      this.exercise = [0,0,0,0];
      this.isFirstTime = false;
      prefs.setBool('isFirstTime', false);
      prefs.setInt('phase', this.phase);
      prefs.setInt('week', this.week);
      prefs.setInt('exLen', exLen);
      for (var i = 0; i < this.exLen; i++) {
        await prefs.setInt('ex${i}', exercise[i]);
      }
    }
    else {
        this.phase = await prefs.getInt('phase');
        this.week = await prefs.getInt('week');
        this.exLen = await prefs.getInt('exLen');

        for (var i = 0; i < this.exLen; i++) {
          this.exercise[i] = await prefs.get('ex${i}');
        }
    }
  }

  exDone(int which) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
      this.exercise[which] = prefs.getInt('ex${which}') + 1;

    prefs.setInt('ex${which}', this.exercise[which]);
  }

  weekDone() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    this.week = prefs.getInt('week') + 1;

    prefs.setInt('week', this.week);
  }

  phaseDone() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    this.phase = prefs.getInt('phase') + 1;

    prefs.setInt('phase', this.phase);
  }
}