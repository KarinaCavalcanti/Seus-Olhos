import 'dart:io';

import 'package:flutter/material.dart';
import 'package:seus_olhos/classes/app_route.dart';
import 'package:seus_olhos/pages/imageLabel.dart';

class ResponseImgRecog extends StatefulWidget {
  @override
  _ResponseImgRecogState createState() => _ResponseImgRecogState();
}

class _ResponseImgRecogState extends State<ResponseImgRecog> {
  List output;

 
  @override
  Widget build(BuildContext context) {
    this.output = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Wrap(
                    children: [ 
                      output == null 
                      ?Text('Você fechou a câmera, retorne ao menu!')
                      :Text('${output[0]["label"]}'),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 10.0,
                    bottom: 10.0,
                  ),
                  child: FlatButton.icon(
                    icon: Icon(
                      Icons.close,
                      size: 23.0,
                      color: Color(0xFF00656B),
                    ),
                    label: Text(
                      'FECHAR',
                      style: TextStyle(
                        color: Color(0xFF00656B),
                        fontSize: 18.0,
                      ),
                    ),
                    onPressed: () {
                      //ao retornar da página fecha o menu hamburguinho
                      Navigator.of(context).pop(true);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
