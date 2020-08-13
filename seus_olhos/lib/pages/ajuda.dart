import 'package:flutter/material.dart';

class Ajuda extends StatefulWidget {
  @override
  _AjudaState createState() => _AjudaState();
}

class _AjudaState extends State<Ajuda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'AJUDA',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF00656B),
      ),
      body: Text('ajuda'),
    );
  }
}
