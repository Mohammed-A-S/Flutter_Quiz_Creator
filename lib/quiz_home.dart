import 'package:flutter/material.dart';
import 'package:quiz_game/quiz_screen.dart';

class Quiz_home extends StatelessWidget 
{
  const Quiz_home({Key? key}) : super(key: key);

  static const _levels = ["Easy", "Normal", "Hard"];

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      appBar: AppBar(title: const Text("Quiz"),),



      body: Padding
      (
        padding: const EdgeInsets.all(8.0),
        child: Column
        (
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:
          [
            for (var level in _levels)
            Padding
            (
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton
              (
                onPressed: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Quiz_screen(level),));
                }, 
                child: Padding
                (
                  padding: const EdgeInsets.all(8.0),
                  child: Text(level),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}