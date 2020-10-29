import 'package:flutter/material.dart';
import 'package:seus_olhos/classes/app_route.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width,
           decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
               stops: [
                  0.2,
                  1.0,
                ],
                colors: [
                  Color(0xFF00656B),
                  Color(0xFF0084A1),
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(75),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 10.0,
                  offset: Offset(
                    3.0,
                    3.0,
                  ),
                ),
              ],
            ),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'SEUS OLHOS',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Image.asset(
                    'assets/images/white.png',
                    height: 170.0,
                    width: 170.0,
                    semanticLabel:
                        "Logo do aplicativo. Desenho de um celular com um olho no centro",
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 60.0,
                    width: 140.0,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [
                          0.1,
                          1.0,
                        ],
                        colors: [
                          Color(0xFF00656B),
                          Color(0xFF0084A1),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(1.0, 2.0),
                          blurRadius: 5.0,
                        ),
                      ],
                    ),
                    child: Semantics(
                      label: 'Botão, toque duplo para iniciar',
                      child: FlatButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(AppRoutes.INT_PAGE);
                        },
                        child: Text(
                          'INICIAR',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100.0,
                  ),
                  Text(
                    '\© Todos os direitos reservados a Adrian Toninato e Karina Lucindo.',
                    style: TextStyle(
                      fontSize: 13.0,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
