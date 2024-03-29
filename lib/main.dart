import 'package:flutter/material.dart';
import 'package:flutter_widget_lifecycle_demo/screens/didChangeDependancy_demo.dart';

void main(){
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DidChangeDependencyDemo(),
    );
  }
}