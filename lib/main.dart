import 'package:flutter/material.dart';

import 'Home.dart';


void main(){
  runApp(TicApp());
}

class TicApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor:Colors.purple,
      ),
        home:Home(),
    );
  }
}

