import 'package:flutter/material.dart';

class SobreNos extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<SobreNos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'SOBRE NÓS',
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF00656B),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('NOSSO OBJETIVO'),
          ],
        ),
      ),
    );
  }
}
