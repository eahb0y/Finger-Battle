import 'package:flutter/material.dart';

import 'fingerBattle.dart';

void main() =>
    runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: FingerBattle(),
      ),
    );
  }
}
