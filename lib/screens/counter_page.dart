import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterPageRoute extends StatefulWidget {
  const CounterPageRoute({
    Key? key,
  }) : super(key: key);

  @override
  _CounterPageRoute createState() => new _CounterPageRoute();
}

class _CounterPageRoute extends State<CounterPageRoute> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: _incrementCounter,
        child: Text('Increment Counter ' + counter.toString()),
      ),
    );
  }

  _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      counter = (prefs.getInt('counter') ?? 0) + 1;
    });

    print('Pressed $counter times.');
    await prefs.setInt('counter', counter);
  }
}
