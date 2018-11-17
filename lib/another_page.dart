import 'package:flutter/material.dart';
import 'package:hero_widget/main.dart';

class AnotherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Hero(
                tag: 'hero1',
                child: Container(
                  padding: EdgeInsets.only(top: 50.0),
                  height: 250.0,
                  width: 250.0,
                  child: CustomLogo(),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Hero(
                tag: 'hero2',
                child: Material(
                    color: Colors.transparent,
                    child: Text(
                      'Master Yoda',
                      style: TextStyle(fontSize: 40.0),
                    )),
              ),
            ),
            OutlineButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Icon(Icons.close),
            )
          ],
        ),
      ),
    );
  }
}
