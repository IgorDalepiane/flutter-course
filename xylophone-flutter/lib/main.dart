import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/services.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatefulWidget {
  @override
  _XylophoneAppState createState() => _XylophoneAppState();
}

class _XylophoneAppState extends State<XylophoneApp> {
  void playSound(var soundNumber) {
    final player = AudioCache();
    player.play('note$soundNumber.wav');
  }

  Expanded buildKey({Color color, var soundNumber}) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color,
        ),
        onPressed: () {
          playSound(soundNumber);
        },
      ),
    );
  }

  int appType = 0;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: null,
          titleSpacing: 0,
          backgroundColor: Colors.black,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: appType == 0
                        ? Colors.green.shade400
                        : Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      appType = 0;
                    });
                  },
                  child: Text(
                    'Xylophone',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: appType == 1
                        ? Colors.green.shade400
                        : Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      appType = 1;
                    });
                  },
                  child: Text(
                    'Bells',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(
                  color: Colors.red,
                  soundNumber: appType == 0 ? 1 : 'A'),
              buildKey(
                  color: Colors.orange,
                  soundNumber: appType == 0 ? 2 : 'B'),
              buildKey(
                  color: Colors.yellow,
                  soundNumber: appType == 0 ? 3 : 'C'),
              buildKey(
                  color: Colors.green,
                  soundNumber: appType == 0 ? 4 : 'D'),
              buildKey(
                  color: Colors.teal,
                  soundNumber: appType == 0 ? 5 : 'E'),
              buildKey(
                  color: Colors.blue,
                  soundNumber: appType == 0 ? 6 : 'F'),
              buildKey(
                  color: Colors.purple,
                  soundNumber: appType == 0 ? 7 : 'G'),
            ],
          ),
        ),
      ),
    );
  }
}
