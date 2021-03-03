import 'package:flutter/material.dart';


class Game{
  final id;
  String text;
  Color bg;
  bool enabled;

  Game({this.id,this.text="",this.bg=Colors.purple,this.enabled=true});

}