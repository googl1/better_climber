import 'package:flutter/material.dart';
import './profile.dart';

class ExTile extends StatefulWidget {
  String label;
  BuildContext context;
  String helpTitle;
  String help;
  int of;
  Profile profile;
  int num;

  @override
  _ExTileState createState() =>
      new _ExTileState(profile, num, label, helpTitle, help, of, context);

  @override
  ExTile(Profile profile, int num, String label, String helpTitle, String help, int of,
      BuildContext context) {
    this.profile = profile;
    this.num = num;
    this.label = label;
    this.context = context;
    this.helpTitle = helpTitle;
    this.help = help;
    this.of = of;
  }
}

class _ExTileState extends State<ExTile> {
  String _label;          // the name of the tile
  BuildContext _context;  // FIXME: really needed?
  String _helpTitle;      // FIXME: is this displayed?
  String _help;           // shown when help button tapped
  int _of;                // how many do i have to do of those exercises?
  int exNumber;           // identifies exercise number in the week
  Profile profile;        // contains info on how much of what is done and has to be done

  @override
  _ExTileState(Profile profile, int num, String label, String helpTitle, String help, int of,
      BuildContext context) {
    this.profile = profile;
    this._label = label;
    this._context = context;
    this._helpTitle = helpTitle;
    this._help = help;
    this._of = of;
    this.exNumber = num;
  }

  void _handleTap() {
    profile.exDone(exNumber);
  }

  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).primaryColor;

    return new ListTile(
      title: new Text(this._label,
          style: new TextStyle(fontWeight: FontWeight.w500)),
      onTap: _handleTap,
      leading: new Text(this.profile.exercise[exNumber].toString() + '/' + this._of.toString()),
      trailing: new IconButton(
        icon: new Icon(Icons.help),
        tooltip: 'Details',
        onPressed: () {
          showDialog(
              context: context,
              child: new SimpleDialog(
                  title: new Text(this._helpTitle),
                  contentPadding: new EdgeInsets.all(32.0),
                  children: [
                    new Text(this._help),
                  ]));
        },
      ),
    );
  }
}
