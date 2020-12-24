
import 'dart:math';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DemoApp(),
      theme: ThemeData(
        brightness: Brightness.dark
      ),
    );
  }
}

class DemoApp extends StatefulWidget {
  @override
  _DemoAppState createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {

  ConfettiController _confettiController;
  ConfettiController _confettiController2;

  @override
  void initState() {
    // TODO: implement initState
    _confettiController = ConfettiController(duration: Duration(milliseconds: 500));
    _confettiController2 = ConfettiController(duration: Duration(milliseconds: 500));
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _confettiController.dispose();
    _confettiController2.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo App'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: ConfettiWidget(
                confettiController: _confettiController,
              shouldLoop: true,
              blastDirection: pi / 2,
              colors: [
                Colors.red,
                Colors.green,
                Colors.yellow,
                Colors.purpleAccent,
              ],
              numberOfParticles: 10,
              gravity: 1,
              blastDirectionality: BlastDirectionality.explosive,
              displayTarget: false,
              emissionFrequency: 0.02,
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: FlatButton(
                onPressed: (){
                  _confettiController.play();
                },
                child: Text('Top'),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ConfettiWidget(
              confettiController: _confettiController2,
              shouldLoop: false,
              blastDirection: -pi / 2,
              colors: [
               Colors.orange,
                Colors.orangeAccent,
                Colors.deepOrange,
                Colors.deepOrangeAccent,
              ],
              maxBlastForce: 50.0,
              minBlastForce: 10.0,
              numberOfParticles: 50,
              blastDirectionality: BlastDirectionality.directional,
              displayTarget: true,
              emissionFrequency: 0.02,
              gravity: 0.05,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: FlatButton(
                onPressed: (){
                  _confettiController2.play();
                },
                child: Text('Bottom'),
            ),
          )
        ],
      ),
    );
  }
}













