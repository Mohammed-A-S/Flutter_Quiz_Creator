import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class Quiz_screen extends StatefulWidget
{
  final String level;
  const Quiz_screen(this.level, {Key? key}) : super(key: key);

  @override
  State<Quiz_screen> createState() => _Quiz_screenState();
}

class _Quiz_screenState extends State<Quiz_screen>
{
  var _x, _y;
  var _random = new Random();

  var _count = 0;
  var _correct = 0;

  var _timer;
  var _seconds;

  List<int> _answer = [];
  final List<MaterialColor> _colors = [Colors.red, Colors.blue, Colors.green, Colors.purple];


  @override
  void initState()
  {
    // TODO: implement initState
    super.initState();

    _qustions();
    inittimer();
  }



  @override
  void dispose() 
  {
    // TODO: implement dispose
    super.dispose();

    _qustions();
    inittimer();
  }



  void _qustions()
  {
    _count++;

    _x = _random.nextInt(10);
    _y = _random.nextInt(10);
    _answer = [_x * _y];

    for (int i = 0; i<3; i++)
      {
        var n = _random.nextInt(100);
        _answer.add(n);
      }

    _answer.shuffle(); // for making _answer ordring randomly between var n
  }


  void _choice(int index)
  {
    var _right_answer = _answer[index];
    var _message;

    if(_right_answer == _x*_y)
      {
        _message = "correct";
        _correct++;
      }
    else
      {
        _message = "wrong";
      }

    ScaffoldMessenger.of(context).clearSnackBars(); // ScaffoldMessenger is the littel temporary popup screen from the bottom
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(_message), duration: Duration(seconds: 2), behavior: SnackBarBehavior.floating,));
  }



  void _count_end()
  {
    _timer.cancel();

    if(_count == 5)
    {
      showDialog
      (context: context, builder: (context) //showDialog is a popup screen not temporary should have Navigator.pop() to go back
        {
          return AlertDialog
            (
              title: Text("Your Score"),
              content: Text("Your Scoure is: $_correct out of 5"),
              actions:
              [
                TextButton
                  (
                    onPressed: ()
                    {
                      Navigator.popUntil(context, ModalRoute.withName("/"));
                    },
                    child: const Text("Ok")
                  ),
              ],
            );
        }
      );
      return;
    }

    _qustions();
    inittimer();

    setState(() {

    });
  }



  void inittimer()
  {
    //putting the second depend on the level name
    if(widget.level == "Easy")
      {
        _seconds = 30;
      }
    else if (widget.level == "Normal")
      {
        _seconds = 15;
      }
    else
      {
        _seconds = 5;
      }


      //count down every second at real time
      //Timer.periodic update depnding on Duration, at each second
      _timer = Timer.periodic(Duration(seconds: 1), (timer)
      {
        if(_seconds == 0)
        {
          _count_end();
        }
        else
        {
          _seconds--;

          setState(() {

          });
        }
      }
    );
  }



  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: AppBar(backgroundColor: Colors.red,),

      body: Padding
      (
        padding: const EdgeInsets.only(top: 20, bottom: 10, left: 10, right: 10),
        child: Column
        (
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:
          [
            Text("What's $_x * $_y?", style: TextStyle(fontSize: 35),),


            Text("$_seconds", style: TextStyle(color: Colors.red, fontSize: 40),),


            GridView.builder
            (
                itemCount: 4,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 3/2, crossAxisSpacing: 10, mainAxisSpacing: 10),
                itemBuilder: (context, index) => ElevatedButton
                (
                  child: Text("${_answer[index]}"),
                  style: ElevatedButton.styleFrom(backgroundColor: _colors[index]),
                  onPressed:()
                  {
                    _choice(index);
                    _count_end();
                  },
                ),
            ),
          ],
        ),
      ),
    );
  }
}
