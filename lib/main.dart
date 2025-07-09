import 'dart:math';

import 'package:color_app/config.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(_ColorApp());
}

// ignore: prefer_match_file_name
class _ColorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Color App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white10),
      ),
      home: _HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class _HomePage extends StatefulWidget {
  @override
  State<_HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<_HomePage> {
  int _tapCount = 0;
  final Random _random = Random();
  Color _backgroundColor = Colors.white;
  final List<String> _emojis = ['😄', '😱', '😵', '😶', '💪'];
  String _currentEmoji = '💩';

  void _changeBackgroundColor() {
    setState(() {
      _backgroundColor = Color.fromRGBO(
        _random.nextInt(AppConfig.maxRgbValue),
        _random.nextInt(AppConfig.maxRgbValue),
        _random.nextInt(AppConfig.maxRgbValue),
        AppConfig.fullOpacity,
      );
      _tapCount++;
      if (_tapCount > AppConfig.initialTapCountThreshold &&
          _tapCount % AppConfig.emojiChangeInterval == 0) {
        final int nextIndex =
            (_emojis.indexOf(_currentEmoji) + 1) % _emojis.length;
        _currentEmoji = _emojis[nextIndex];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          'Color App',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 24,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: _changeBackgroundColor,
        child: Scaffold(
          body: AnimatedContainer(
            duration: const Duration(
              milliseconds: AppConfig.animationDurationMs,
            ),
            color: _backgroundColor,
            child: Center(
              child: Column(
                children: [
                  const Spacer(),
                  Stack(
                    children: <Widget>[
                      Text(
                        'HELLO THERE',
                        style: TextStyle(
                          fontSize: AppConfig.fontSizeHello,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = AppConfig.strokeWidth
                            ..color = Colors.black,
                        ),
                      ),
                      const Text(
                        'HELLO THERE',
                        style: TextStyle(
                          fontSize: AppConfig.fontSizeHello,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppConfig.spacingHeight),
                  Stack(
                    children: <Widget>[
                      Text(
                        "You changed color $_tapCount times $_currentEmoji",
                        style: TextStyle(
                          fontSize: AppConfig.fontSizeTapCount,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = AppConfig.strokeWidth
                            ..color = Colors.black,
                        ),
                      ),
                      Text(
                        "You changed color $_tapCount times $_currentEmoji",
                        style: const TextStyle(
                          fontSize: AppConfig.fontSizeTapCount,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
