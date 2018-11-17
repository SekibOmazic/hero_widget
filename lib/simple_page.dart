import 'package:flutter/material.dart';

import 'package:hero_widget/main.dart';

class SimplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Hero(
                tag: 'hero1',
                child: Container(
                  height: 250.0,
                  width: 250.0,
                  child: CustomLogo(),
                ),
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
