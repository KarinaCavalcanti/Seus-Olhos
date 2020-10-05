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
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text(
              'O aplicativo Seus Olhos busca auxiliar mais de meio milhão de pessoas cegas em nosso país a terem uma vida mais autônoma.',
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Para isso, o aplicativo possui dois mecanismos, sendo eles, o reconhecimento de cédulas de real e o reconhecimento e leitura de pequenos textos que não estão em Braille.',
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Com o auxílio do leitor de tela, já utilizado pelo usuário, basta uma fotografia para que a cédula ou o texto seja reconhecido e lido em voz alta.',
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    'SEUS OLHOS',
                    style: TextStyle(
                      color: Color(0xFF00656B),
                      fontSize: 14.0,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Semantics(
                    child: Image.asset(
                    'assets/images/blue.png',
                    height: 70.0,
                    width: 70.0,
                  ),
                  label: 'Logo do aplicativo. Desenho de um celular com um olho no centro',
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Divider(
                    color: Color(0xFF00656B),
                    height: 1,
                    thickness: 0.5,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
            Text(
              'Possui alguma dúvida? Contate-nos!',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'loremipsum@dolor.sit',
              style: TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'VOLTAR',
                style: TextStyle(
                  color: Color(0xFF00656B),
                  fontSize: 16.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
