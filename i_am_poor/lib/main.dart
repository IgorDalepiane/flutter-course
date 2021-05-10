import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Center(
          child: Text('I Am Poor'),
        ),
        backgroundColor: Colors.grey[800],
      ),
      body: Center(
        child: Image(
          image: AssetImage('images/mine.jpg'),
        ),
      ),
    ),
  ));
}
