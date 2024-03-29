import 'package:flutter/material.dart';

class InitStateDemo extends StatefulWidget {
  const InitStateDemo({super.key});

  @override
  State<InitStateDemo> createState() => _InitStateDemoState();
}

class _InitStateDemoState extends State<InitStateDemo> with TickerProviderStateMixin {
  //initialize variable later
  late final AnimationController _animationController;
  late final String title;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(title),
      ),
    );
  }
}
