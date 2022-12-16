import 'package:flutter/material.dart';
import 'package:quiz_game/quiz_home.dart';

void main() 
{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp
    (
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(backgroundColor: Colors.black),
      home: Quiz_home(),
      theme: ThemeData
      (
        elevatedButtonTheme: ElevatedButtonThemeData
        (
          style: ElevatedButton.styleFrom
          (
            textStyle: TextStyle(fontSize: 36),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16),),
          ),
        ),
      ),
    );
  }
}

