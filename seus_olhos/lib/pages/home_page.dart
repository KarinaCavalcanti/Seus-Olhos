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
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                height: 420.0,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [
                      0.3,
                      1.0,
                    ],
                    colors: [
                      Color(0xFF00859B),
                      Color(0xFF00BBDC),
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(75),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(
                        0.4,
                      ),
                      blurRadius: 10.0,
                      offset: Offset(
                        3.0,
                        3.0,
                      ),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'SEUS OLHOS',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Image.asset(
                      'assets/images/white.png',
                      height: 150.0,
                      width: 150.0,
                      semanticLabel:
                          "Logo do aplicativo. Desenho de um celular com um olho no centro",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Container(
                height: 60.0,
                width: 140.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [
                      0.3,
                      1.0,
                    ],
                    colors: [
                      Color(0xFF00859B),
                      Color(0XFF00BBCD),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(
                        0.4,
                      ),
                      blurRadius: 2.0,
                      offset: Offset(
                        3.0,
                        3.0,
                      ),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: FlatButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRoutes.INT_PAGE);
                  },
                  child: Center(
                    child: Text(
                      "INICIAR",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Text(
                "\© Todos os direitos reservados.",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
