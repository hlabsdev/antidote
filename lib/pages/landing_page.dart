import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Material(
      color: Colors.lightBlueAccent,
      child: new InkWell(
        onTap: () => {'Avancons'},
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("Prevenons le Coronavirus!",
              style: new TextStyle(color: Colors.yellow, fontSize: 25, fontWeight: FontWeight.bold),),
            new Text("Toucher pour Lancer",
              style: new TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}