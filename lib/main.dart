import 'package:flutter/material.dart';
import 'package:pharmacie_de_garde_ui/view/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        scaffoldBackgroundColor: const Color(0xFF5C4DB1)
      ),
      home: Splash(),
    );
  }
}

