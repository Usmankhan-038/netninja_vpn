import "package:flutter/material.dart";

import "Location_Screen.dart";
import "homePage.dart";

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage(), initialRoute: '/', routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/homePage': (context) => HomePage(),
      // When navigating to the "/second" route, build the SecondScreen widget.
      '/locationScreen': (context) => LocationScreen(),
    });
  }
}
