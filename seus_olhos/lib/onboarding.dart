import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  PageController controller = PageController(initialPage: 0, keepPage: false);

  int index = 0;

  List<String> titles = [
    'Seja bem-vindo ou bem-vinda!',
    'Autorize a utilização da sua câmera',
    'Identifique o seu dinheiro',
    'Reconheça textos',
    'PRONTO!',
  ];

  List<String> texts = [
    'Estamos muito felizes por nos escolher!',
    'Para que o Seus Olhos funcione corretamente é necessário que você autorize a utilização da sua câmera.',
    'Para começar a reconhecer notas de real, selecione a opção NOTA e em seguida toque na opção CÂMERA. Serão permitidas apenas uma nota por vez!',
    'Para começar a reconhecer textos impressos, selecione a opção TEXTO e em seguida toque na opção CÂMERA. ',
    'Tudo certo! Agora é só aproveitar!',
  ];

  List<String> desc = [
    'Desenho representando várias pessoas felizes',
    'Desenho de cadeado destrancado',
    'Desenho de uma mão segurando um saco de dinheiro',
    'Desenho representando um jornal com várias informações',
    'Desenho de uma mão representando o símbolo de ok',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            PageView.builder(
              onPageChanged: (val) {
                setState(() {
                  index = val;
                });
              },
              controller: controller,
              itemCount: titles.length,
              itemBuilder: (BuildContext ctx, position) {
                return Container(
                  width: MediaQuery.of(ctx).size.width,
                  height: MediaQuery.of(ctx).size.height,
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 10.0,
                      right: 10.0,
                    ),
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topRight,
                          child: index <= 3
                              ? FlatButton(
                                  onPressed: () {},
                                  child: Text(
                                    "PULAR",
                                    style: TextStyle(
                                      color: Colors.black54,
                                    ),
                                  ),
                                )
                              : SizedBox(),
                        ),
                        Text(
                          '${titles[position]}',
                          style: TextStyle(
                            color: Color(0xFF00859B),
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 80.0,
                        ),
                        Image(
                          image: AssetImage(
                            'assets/images/c${position + 1}.png',
                          ),
                          semanticLabel: "${desc[position]}",
                          width: 150.0,
                          height: 150.0,
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Text(
                          '${texts[position]}',
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 18.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            Positioned(
              bottom: 90.0,
              left: 0.0,
              right: 0.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  dot(index, 0),
                  SizedBox(
                    width: 5.0,
                  ),
                  dot(index, 1),
                  SizedBox(
                    width: 5.0,
                  ),
                  dot(index, 2),
                  SizedBox(
                    width: 5.0,
                  ),
                  dot(index, 3),
                  SizedBox(
                    width: 5.0,
                  ),
                  dot(index, 4),
                ],
              ),
            ),
            Positioned(
              bottom: 20.0,
              left: 0.0,
              right: 0.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  index > 0
                      ? FlatButton(
                          onPressed: () {},
                          child: Text(
                            "ANTERIOR",
                            style: TextStyle(
                              color: Color(0xFF00859B),
                              fontSize: 18.0,
                            ),
                          ),
                        )
                      : SizedBox(),
                  index < 4
                      ? FlatButton(
                          onPressed: () {},
                          child: Text(
                            "PRÓXIMO",
                            style: TextStyle(
                              color: Color(0xFF00859B),
                              fontSize: 18.0,
                            ),
                          ),
                        )
                      : SizedBox(),
                ],
              ),
            ),
            Positioned(
              bottom: 20.0,
              left: 0.0,
              right: 0.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  index == 4
                      ? FlatButton(
                          onPressed: () {},
                          child: Text(
                            "FINALIZAR",
                            style: TextStyle(
                              color: Color(0xFF00859B),
                              fontSize: 18.0,
                            ),
                          ),
                        )
                      : SizedBox(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget dot(index, i) {
  return Container(
    width: 12.0,
    height: 12.0,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(100),
      color: index == i ? Color(0xFF00859B) : Color(0xFFB6D9DF),
    ),
  );
}
