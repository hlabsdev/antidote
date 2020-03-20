import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget{
  final bool _answer;
  final VoidCallback _onTap;
  AnswerButton(this._answer, this._onTap);

  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Material(
        color: _answer == true? Colors.greenAccent: Colors.redAccent,
        child: new InkWell(
          onTap: () => _onTap,
          child: new Center(
            child: new Container(
              decoration: new BoxDecoration(
                border: new Border.all(color: Colors.white, width: 5),
              ),
              padding: new EdgeInsets.all(20.0),
              child: new Text(_answer == true? "Oui": "Non",
              style: new TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),),
            ),
          ),
        ),
      ),
    );
  }

}