import 'dart:async';

import 'package:flutter/material.dart';

class DidUpdateWidgetDemo extends StatefulWidget {
  const DidUpdateWidgetDemo({
    super.key,
    required this.title,
    required this.changeTitle,
  });

  final String title;
  final void Function(String) changeTitle;
  @override
  State<DidUpdateWidgetDemo> createState() => _DidUpdateWidgetDemoState();
}

class _DidUpdateWidgetDemoState extends State<DidUpdateWidgetDemo> {
  String changeDescription = '';
  final TextEditingController textFieldController = TextEditingController();

  @override
  void didUpdateWidget(covariant DidUpdateWidgetDemo oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.title != oldWidget.title) {
      print('title chaged by parent widget...');
      if (mounted) {
        changeDescription = 'parent widget update...';
        setState(() {});
      }
      Future.delayed(const Duration(seconds: 5), () {
        changeDescription = '';
        setState(() {});
      });
    }
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
              widget.title,
              style: const TextStyle(fontSize: 40),
              maxLines: 5,
            ),
            const SizedBox(height: 20),
            changeDescription.isEmpty
                ? const SizedBox()
                : Text(
                    changeDescription,
                    style: const TextStyle(fontSize: 35),
                    maxLines: 5,
                  ),
            const SizedBox(height: 30),
            TextFormField(
              controller: textFieldController,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 30),
            IconButton(
                onPressed: () {
                  widget.changeTitle(textFieldController.text);
                },
                hoverColor: Colors.grey.shade300,
                disabledColor: Colors.grey,
                icon: const Icon(
                  Icons.check,
                  weight: 32,
                  size: 40,
                  color: Colors.blue,
                ))
          ],
        ),
      ),
    );
  }
}
