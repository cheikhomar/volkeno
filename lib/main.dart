import 'package:flutter/material.dart';

import 'MessageLint.dart';



void main() => runApp(EmailApp());

class EmailApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.red, accentColor: Colors.yellow,),
      home: MessageList(title: 'Flutter Demo Home Page'),
    );
  }
}

