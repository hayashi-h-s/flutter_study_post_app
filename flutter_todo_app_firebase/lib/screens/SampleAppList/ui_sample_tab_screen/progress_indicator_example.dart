import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';

class ProgressIndicatorExampleScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<ProgressIndicatorExampleScreen> {
  var _value = 0.0;

  @override
  void initState() {
    const timeout = const Duration(milliseconds: 200);
    Timer.periodic(timeout, (Timer t) {
      setState(() {
        _value = _value + 0.1;
        if (_value > 1) {
          _value = 0.0;
        }
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Indicator Test'),
      ),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            // Determinate
            LinearProgressIndicator(value: _value),
            CircularProgressIndicator(
              value: _value,
            ),
            Divider(),
            // Indeterminate
            LinearProgressIndicator(),
            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}