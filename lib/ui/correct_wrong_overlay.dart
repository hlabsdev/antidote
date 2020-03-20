import 'dart:math';
import 'package:flutter/material.dart';


class CorrectWrongOverlay extends StatefulWidget {
  final bool _isCorrect;

  CorrectWrongOverlay(this._isCorrect);
  @override
  _CorrectWrongOverlayState createState() => _CorrectWrongOverlayState();
}

class _CorrectWrongOverlayState extends State<CorrectWrongOverlay> with SingleTickerProviderStateMixin {
  Animation<double> _iconAnimation;
  AnimationController _iconAnimationController;

  @override
  void initState(){
    super.initState();
    _iconAnimationController = new AnimationController(duration:new Duration(seconds: 3), vsync: this);
    _iconAnimation = new CurvedAnimation(parent: _iconAnimationController, curve: Curves.elasticIn);
    _iconAnimation.addListener(() => this.setState((){}));
    _iconAnimationController.forward();
  }

  Widget build(BuildContext context) {
    return Material(
      color: Colors.black54,
      child: new InkWell(
        onTap: () => print("Overlay"),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: new Transform.rotate(
                angle: _iconAnimation.value*3*pi,
                child: new Icon(widget._isCorrect == true? Icons.loop:Icons.clear, size: _iconAnimation.value*80.0,),
              )
//              child: new Icon(Icons.loop, size: 80.0,),
            ),
            new Padding(padding: new EdgeInsets.only(bottom: 20.0),),
            new Text(widget._isCorrect == true? "Ok":"Wrong", style: new TextStyle(color: Colors.white, fontSize: 30.0),)
          ],
        ),
      ),
    );
  }
}
