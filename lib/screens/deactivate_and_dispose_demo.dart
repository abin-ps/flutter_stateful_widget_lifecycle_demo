import 'dart:async';

import 'package:flutter/material.dart';

class DeactivateAndDisposeDemo extends StatefulWidget {
  const DeactivateAndDisposeDemo({
    super.key,
    required this.title,
    required this.changeTitle,
  });

  final String title;
  final void Function(String) changeTitle;
  @override
  State<DeactivateAndDisposeDemo> createState() => _DeactivateAndDisposeDemoState();
}

class _DeactivateAndDisposeDemoState extends State<DeactivateAndDisposeDemo> {
  String changeDescription = '';
  final TextEditingController textFieldController = TextEditingController();

  @override
  void didUpdateWidget(covariant DeactivateAndDisposeDemo oldWidget) {
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
  void deactivate() {
    print('this calls before dispose calls.');
    super.deactivate();
  }
  @override
  void dispose() {
    print('disposing widget tree.');
    super.dispose();
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
                  Future.delayed(const Duration(seconds: 6), () {
                    Navigator.pop(context);
                  });
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

