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
             'Seus Olhos',
             style: TextStyle( 
               fontSize: 25,
             ),

             ),
           backgroundColor: Color(0XFF00BBCD),
         ),

      body: Text('ajuda'),
    );
  }
}