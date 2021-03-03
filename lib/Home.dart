import 'dart:math';

import 'package:flutter/material.dart';
import 'package:t/next.dart';

import 'Game.dart';



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Game> button;
  var p1;
  var p2;
  var a;

  @override
  void initState() {
    super.initState();
    button=start();
  }
  
  List<Game> start(){
    p1=List();
    p2=List();
    a=1;

    var buttons = <Game>[
      Game(id: 1),
      Game(id: 2),
      Game(id: 3),
      Game(id: 4),
      Game(id: 5),
      Game(id: 6),
      Game(id: 7),
      Game(id: 8),
      Game(id: 9),
    ];
    return buttons;
  }

  void startGame(Game g){
    setState(() {
      if(a==1){
        g.text="X";
        g.bg=Colors.purple;
        a=2;
        p1.add(g.id);
      }else{
        g.text="0";
        g.bg=Colors.cyan;
        a=1;
        p2.add(g.id);
      }
      g.enabled=false;
      int y = Winner();
      if(y==-1){
        if(button.every((element) => element.text!="")){
          showDialog(
            context: context,
            builder: (_)=>Next("Game Draw", "Press Replay To Play Again", replayGame)
          );
        }
        else{
          a==2?computer():null;
        }
      }
    }
    );
  }


  void computer(){
    var emptyCells=List();
    var list = List.generate(9, (i) => i+1);
    for(var d in list){
      if(!(p1.contains(d)||p2.contains(d))){
        emptyCells.add(d);
      }
    }
    var r = Random();
    var index = r.nextInt(emptyCells.length-1);
    var d = emptyCells[index];
    int i  = button.indexWhere((element) => element.id==d);
    startGame(button[i]);
  }

  int Winner(){
    var win = -1;
    if(p1.contains(1) && p1.contains(2) && p1.contains(3)){
      win=1;
    }
     if (p2.contains(1) && p2.contains(2) && p2.contains(3)) {
      win = 2;
    }
    if(p1.contains(4) && p1.contains(5) && p1.contains(6)){
      win=1;
    }
     if (p2.contains(4) && p2.contains(5) && p2.contains(6)) {
      win = 2;
    }
     if(p1.contains(7) && p1.contains(8) && p1.contains(9)){
      win=1;
    }
     if (p2.contains(7) && p2.contains(8) && p2.contains(9)) {
      win = 2;
    }
     if(p1.contains(1) && p1.contains(4) && p1.contains(7)){
      win=1;
    }
     if (p2.contains(1) && p2.contains(4) && p2.contains(7)) {
      win = 2;
    }
     if(p1.contains(2) && p1.contains(5) && p1.contains(8)){
      win=1;
    }
     if (p2.contains(2) && p2.contains(5) && p2.contains(8)) {
      win = 2;
    }
     if(p1.contains(3) && p1.contains(6) && p1.contains(9)){
      win=1;
    }
     if (p2.contains(3) && p2.contains(6) && p2.contains(9)) {
      win = 2;
    }
     if(p1.contains(1) && p1.contains(5) && p1.contains(9)){
      win=1;
    }
     if (p2.contains(1) && p2.contains(5) && p2.contains(9)) {
      win = 2;
    }
     if(p1.contains(3) && p1.contains(5) && p1.contains(7)){
      win=1;
    }
     if (p2.contains(3) && p2.contains(5) && p2.contains(7)) {
      win = 2;
    }

    if(win!=-1){
      if(win==1){
        showDialog(context: context, builder:(_)=>Next("You Won","Press The Replay Button to Play Again", replayGame));
      }else{
        showDialog(context: context, builder:(_)=>Next("Harshit Won","Press The Replay Button to Play Again", replayGame));
      }
    }
    return win;
  }

  void replayGame(){
    if(Navigator.canPop(context)) 
    {Navigator.pop(context);}
    setState(() {
      button=start();
    }); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text(
          "Tic Tac Toe"
        ),
      ),
        body:Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
           Expanded(
                        child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio:1.0,
              crossAxisSpacing: 9.0,
              mainAxisSpacing: 9.0
              ),
                 itemCount:button.length,
                 itemBuilder:(context,index)=>SizedBox(
                   width: 100.0,
                   height: 100.0,
                   child: RaisedButton(
                  onPressed:button[index].enabled ? ()=>startGame(button[index]):null ,
                   padding:EdgeInsets.all(10.0),
                   child:Text(
                     button[index].text,
                     style: TextStyle(
                       color:Colors.white54,
                       fontSize:22.0,
                     ),
                   ),
                   color: button[index].bg,
                   ),
                   ),
      ),
           ),
           RaisedButton(
             onPressed: replayGame,
             child:Text(
               "Replay",
               style: TextStyle(
                 color:Colors.white,
                 fontSize:20.0,
               ),
             ),
             color: Colors.lime,
             
             ),
          ],
            
        ),
    );
  }
}