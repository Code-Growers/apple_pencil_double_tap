import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:apple_pencil_double_tap/apple_pencil_double_tap.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _applePencilDoubleTapPlugin = ApplePencilDoubleTap();

  @override
  void initState() {
    super.initState();
    initApplePencilListener();
  }

  void initApplePencilListener() {
    _applePencilDoubleTapPlugin
        .listen((PreferredDoubleTapAction preferedAction) {
      if (kDebugMode) {
        print('Double tap detected. Prefered user action: $preferedAction');
      }
    });
  }

  @override
  void dispose() {
    _applePencilDoubleTapPlugin.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Apple pencil double tap plugin example app'),
        ),
        body: const Center(
          child: TextField(
            decoration: InputDecoration(
                hintText:
                    "Use apple pencil to write something. Double tap and check logs"),
          ),
        ),
      ),
    );
  }
}
