import 'package:flutter/material.dart';
import 'package:hero_widget/hero_dialog_route.dart';
import 'package:hero_widget/simple_page.dart';
import 'package:hero_widget/another_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HeroAnimationPage(),
    );
  }
}

class HeroAnimationPage extends StatefulWidget {
  @override
  _HeroAnimationPageState createState() => _HeroAnimationPageState();
}

class _HeroAnimationPageState extends State<HeroAnimationPage> {
  _onButtonTap(Widget page) {
    Navigator.push(
        context,
        MaterialPageRoute(
            fullscreenDialog: true, builder: (BuildContext context) => page));
  }

  _onButtonTapPopup(Widget page) {
    Navigator.push(
        context, HeroDialogRoute(builder: (BuildContext context) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero animations with Master Yoda'),
      ),
      body: Container(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _buildCustomButton('Simple Hero', SimplePage()),
              _buildCustomButton('Two Heroes', AnotherPage()),
              _buildCustomButton('Hero on Dialog', _buildPopUp(context),
                  isPopup: true),
              _buildCustomButton('Custom Hero Animation', SimplePage(),
                  isCustom: true),
              Hero(
                tag: 'hero1',
                child: ClipOval(
                  child: CustomLogo(
                    size: 60.0,
                  ),
                ),
              ),
              Hero(
                  tag: 'hero2',
                  child: Material(
                    color: Colors.transparent,
                    child: Text(
                      'Master Yoda',
                      style: TextStyle(fontSize: 14.0, color: Colors.black),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  _onButtonTapCustom(Widget page) {
    Navigator.of(context).push(
      PageRouteBuilder<Null>(
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return AnimatedBuilder(
              animation: animation,
              builder: (BuildContext context, Widget child) {
                return Opacity(
                  opacity: animation.value,
                  child: page,
                );
              });
        },
        transitionDuration: Duration(milliseconds: 600),
      ),
    );
  }

  _buildCustomButton(String text, Widget page,
      {bool isPopup = false, bool isCustom = false}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MaterialButton(
        height: 40.0,
        padding: EdgeInsets.all(10.0),
        color: Colors.lightBlue,
        onPressed: () {
          if (isPopup) {
            _onButtonTapPopup(page);
          } else if (isCustom) {
            _onButtonTapCustom(page);
          } else {
            _onButtonTap(page);
          }
        },
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 13.0),
        ),
      ),
    );
  }

  _buildPopUp(BuildContext context) {
    return Center(
      child: AlertDialog(
        title: Hero(
            tag: 'hero2',
            child: Material(child: Text('Begun, the Hero animation has'))),
        content: Container(
          child: Hero(
              tag: 'hero1',
              child: CustomLogo(
                size: 300.0,
              )),
        ),
        actions: <Widget>[
          OutlineButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Icon(Icons.close),
          ),
        ],
      ),
    );
  }
}

class CustomLogo extends StatelessWidget {
  final double size;

  CustomLogo({this.size = 200.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: size,
      height: size,
      child: Center(
        child: Image.asset(
          'images/yoda.png',
          width: size,
          height: size,
        ),
      ),
    );
  }
}
