import 'package:flutter/material.dart';

import 'screens/didChangeDependancy_demo.dart';
import 'screens/didUpdateWidget_demo.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  String title = 'Type something and click tick mark';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: DidChangeDependencyDemo(),
      home: DidUpdateWidgetDemo(
        title: title,
        changeTitle: (String input) {
          setState(() {
            title = input;
          });
        },
      ),
    );
  }
}
