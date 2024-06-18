import 'package:apple_pencil_double_tap/apple_pencil_double_tap.dart';
import 'package:apple_pencil_double_tap/entities/preferred_action.dart';
import 'package:flutter/material.dart';

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
    _applePencilDoubleTapPlugin.listen(
      v1Callback: (PreferredAction preferedAction) {
        print('Double tap detected. Prefered user action: $preferedAction');
      },
      onTapAction: (TapAction action) {
        print('TapAction: $action');
      },
      onSqueeze: (SqueezeAction action) {
        print('SqueezeAction: $action');
      },
      onError: (e) {
        print('Error: $e');
      },
    );
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
            decoration: InputDecoration(hintText: "Use apple pencil to write something. Double tap and check logs"),
          ),
        ),
      ),
    );
  }
}
