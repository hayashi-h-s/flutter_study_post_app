import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PoPupMenuScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<PoPupMenuScreen> {
  var _selectedValue = 'Hawaii';
  var _usStates = ["California", "Hawaii", "Texas"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popup'),
        actions: <Widget>[
          PopupMenuButton<String>(
            initialValue: _selectedValue,
            onSelected: (String s) {
              setState(() {
                _selectedValue = s;
              });
            },
            itemBuilder: (BuildContext context) {
              return _usStates.map((String s) {
                return PopupMenuItem(
                  child: Text(s),
                  value: s,
                );
              }).toList();
            },
          )
        ],
      ),
      body: Center(
        heightFactor: 4,
        child: Text(
          _selectedValue,
          style: TextStyle(
            fontSize: 28.0,
          ),
        ),
      ),
    );
  }
}