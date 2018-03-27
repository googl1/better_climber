import 'package:shared_preferences/shared_preferences.dart';
import './phase.dart';
import 'package:collection/collection.dart';
import './phaseView.dart';
import 'dart:async';
import 'package:flutter/material.dart';

class Profile {
  Phase phase;
  int num_phase;
  int week;
  var exercise;
  bool isFirstTime;
  int exLen;
  SharedPreferences prefs;
  Function _equal;

  @override
  Profile() {
    _equal = const ListEquality().equals;
  }

  loadProfile() async
  {
    prefs = await SharedPreferences.getInstance();

    this.exercise = [0,0,0,0];

    this.isFirstTime = await prefs.getBool('isFirstTime');
    this.isFirstTime = true;

    if (isFirstTime == null)
      isFirstTime = true;
    if (isFirstTime) {
      this.num_phase = 1;
      this.week = 1;
      this.exLen = 4;
      this.exercise = [0,0,0,0];
      //this.isFirstTime = false;
      prefs.setBool('isFirstTime', false);
      prefs.setInt('phase', this.num_phase);
      prefs.setInt('week', this.week);
      prefs.setInt('exLen', exLen);
      for (var i = 0; i < this.exLen; i++) {
        await prefs.setInt('ex${i}', exercise[i]);
      }
    }
    else {
        this.num_phase = await prefs.getInt('phase');
        this.week = await prefs.getInt('week');
        this.exLen = await prefs.getInt('exLen');

        for (var i = 0; i < this.exLen; i++) {
          this.exercise[i] = await prefs.get('ex${i}');
        }
    }
    this.phase = new Phase(num_phase);
  }

  exDone(int which, PhaseViewState phaseState) async {
    this.exercise[which]++;
    prefs.setInt('ex${which}', this.exercise[which]);

    if (_equal(this.exercise, phase.weeks[this.week - 1].todo)) {
      await this.weekDone();
      phaseState.change();
    }
  }

  weekDone() async {
    this.week++;

    print("week:${week} of ${phase.num_weeks}");
    if (this.week > phase.num_weeks) {
      await this.phaseDone();
      this.week = 1;

    }

    prefs.setInt('week', this.week);

    this.exLen = this.phase.weeks[this.week - 1].num_ex;
    this.exercise = new List(this.exLen);
    for (var i = 0; i < this.exLen; i++) {
      this.exercise[i] = 0;
    }
    prefs.setInt('exLen', exLen);
    for (var i = 0; i < this.exLen; i++) {
      await prefs.setInt('ex${i}', exercise[i]);
    }
  }

  phaseDone() async {
    print("phaseDone");
    this.num_phase++;
    prefs.setInt('phase', this.num_phase);
    this.phase = new Phase(num_phase);
  }
}