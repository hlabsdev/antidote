import 'package:antidote/models/slide.dart';
import 'package:antidote/widgets/slide_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      }
      else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
          _currentPage, duration: Duration(milliseconds: 300),
          curve: Curves.easeIn);
    });
  }

  _onPageChange(int index){
    setState(() {
      _currentPage = index;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: AppBar(
//        title: Text('Home'),
//      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: _pageController,
                  onPageChanged: _onPageChange,
                  itemBuilder: (ctx, i) => SlideItem(i),
                  itemCount: slideList.length,
                ),
              ),
              SizedBox(height: 20,),
              Column(
                children: <Widget>[
                  FlatButton(
                    child: Text(
                      "Adoptez les bons gestes",
                      style: TextStyle(fontSize: 18),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    padding: const EdgeInsets.all(15),
                    color: Theme
                        .of(context)
                        .primaryColor,
                    textColor: Colors.white,
                    onPressed: () {},
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Pour passer apuyez >>",
                        style: TextStyle(fontSize: 15),
                      ),
                      FlatButton(
                        child: Text(
                          "Skip",
                          style: TextStyle(fontSize: 18),
                        ), onPressed: () {},
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
