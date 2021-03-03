import "package:flutter/material.dart";


class Next extends StatelessWidget {

  final title;
  final data;
  final VoidCallback call;
  final action;

  Next(this.title,this.data,this.call,[this.action="replay"]);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title
      ),
      content: Text(
        data
      ),
      actions: [
        FlatButton(onPressed: call, 
        color: Colors.orange,
        child:Text(
          action
        ),
        )
      ],
    );
  }
}