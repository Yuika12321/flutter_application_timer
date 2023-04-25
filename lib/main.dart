import 'dart:async';

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
  int times = 1 * 60; // 1min
  late Timer timer;
  void timeStart() {
    // 1초마다 1씩 내려감 == 일정 간격마다 수행
    Timer timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        times--;
      });
    });
  }

  void timeStop() {
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(children: [
          Flexible(
            flex: 1,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black,
              child: const Center(
                child: Text(
                  'My Timer',
                  style: TextStyle(color: Colors.white, fontSize: 50),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.grey,
              child: Center(
                child: Text(
                  '$times',
                  style: const TextStyle(color: Colors.black, fontSize: 50),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.green,
              child: Center(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  IconButton(
                      iconSize: 50,
                      onPressed: timeStart,
                      icon: const Icon(Icons.play_circle_rounded)),
                  const IconButton(
                      iconSize: 50,
                      onPressed: null,
                      icon: Icon(Icons.circle_rounded)),
                ]),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
