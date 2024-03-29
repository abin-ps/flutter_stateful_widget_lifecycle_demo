import 'dart:async';

import 'package:flutter/material.dart';

class DidChangeDependencyDemo extends StatefulWidget {
  const DidChangeDependencyDemo({super.key});

  @override
  State<DidChangeDependencyDemo> createState() => _DidChangeDependencyDemoState();
}

class _DidChangeDependencyDemoState extends State<DidChangeDependencyDemo> {
  String title = '';

  //update on initstate
  @override
  void initState() {
    super.initState();
    if (mounted) {
      title = 'Wait for user input...';
      setState(() {});
    }
  }

  @override
  void didChangeDependencies() {
    Timer.periodic(const Duration(seconds: 5), (timer) {
      if (mounted) {
        title = 'I clear all you typed 😁😁';
        setState(() {});
      }
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          title,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
