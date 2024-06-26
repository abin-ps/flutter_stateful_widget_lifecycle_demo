import 'dart:async';

import 'package:flutter/material.dart';

class DidChangeDependencyDemo extends StatefulWidget {
  const DidChangeDependencyDemo({super.key});

  @override
  State<DidChangeDependencyDemo> createState() => _DidChangeDependencyDemoState();
}

class _DidChangeDependencyDemoState extends State<DidChangeDependencyDemo> {
  String title = '';
  final TextEditingController textFieldController = TextEditingController();

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
    Future.delayed(const Duration(seconds: 5), () {
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 40),
            ),
            const SizedBox(height: 30),
            TextFormField(
              onFieldSubmitted: (v) {
                setState(() {
                  title = v;
                });
              },
              controller: textFieldController,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 30),
            IconButton(
                onPressed: () {
                  setState(() {
                    title = textFieldController.text;
                  });
                },
                hoverColor: Colors.grey.shade300,
                disabledColor: Colors.grey,
                icon: const Icon(
                  Icons.check,
                  weight: 32,
                  size: 48,
                  color: Colors.blue,
                ))
          ],
        ),
      ),
    );
  }
}
