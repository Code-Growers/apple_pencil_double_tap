import 'package:apple_pencil_double_tap/apple_pencil_double_tap.dart';
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
      v1Callback: (PreferredAction preferredAction) {
        debugPrint(
          'Double tap detected. Preferred user action: $preferredAction',
        );
      },
      onTapAction: (TapAction action) {
        debugPrint('TapAction: $action');
      },
      onSqueeze: (SqueezeAction action) {
        debugPrint('SqueezeAction: $action');
      },
      onError: (e) {
        debugPrint('Error: $e');
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
            decoration: InputDecoration(
              hintText: "Write with Apple Pencil. On a supported iPad, double-tap or squeeze and check the logs.",
            ),
          ),
        ),
      ),
    );
  }
}
