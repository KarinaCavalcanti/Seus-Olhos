import 'package:flutter/material.dart';
import 'package:seus_olhos/classes/app_route.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  PageController _pageController =
      PageController(initialPage: 0, keepPage: false);

  int index = 0;

  List<String> titles = [
    'Seja bem-vindo ou bem-vinda!',
    'Autorize a utilização da sua câmera',
    'Identifique o cédulas de real',
    'Reconheça textos que não estão em Braille',
    'Antes de começar, um aviso...'
  ];

  List<String> texts = [
    'Estamos muito felizes que tenha nos escolhido!',
    'Para o Seus Olhos funcionar corretamente, autorize a utilização da sua câmera',
    'Com o Seus Olhos, pessoas cegas serão auxiliadas a reconhecerem com facilidade cédulas de real',
    'Com o Seus Olhos será possível também reconhecer textos que não estão em Braille. Para isso, basta uma fotografia!',
    'É importante lembrar que as identificações não são exatas e sim aproximadas. Aproveite!'
  ];

  List<String> desc = [
    'Desenho representando várias pessoas felizes',
    'Desenho de cadeado destrancado',
    'Desenho de uma mão segurando um saco de dinheiro',
    'Desenho representando um jornal com várias informações',
    'Desenho representando uma mão fazendo o símbolo de okay'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            PageView.builder(
              onPageChanged: (val) {
                setState(() {
                  index = val;
                });
              },
              controller: _pageController,
              itemCount: titles.length,
              itemBuilder: (BuildContext context, position) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IndexedSemantics(
                          index: 0,
                          child: Text(
                            '${titles[position]}',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 25.0,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        IndexedSemantics(
                          index: 0,
                          child: Semantics(
                            child: Image(
                              image: AssetImage(
                                'assets/images/c${position + 1}.png',
                              ),
                              width: 130.0,
                              height: 130.0,
                            ),
                            label: "${desc[position]}",
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        IndexedSemantics(
                          index: 0,
                          child: Text(
                            '${texts[position]}',
                            style: TextStyle(
                              color: Colors.black54,
                              fontSize: 16.0,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            Container(
              width: double.infinity,
              height: 55.0,
              child: Align(
                alignment: Alignment.centerRight,
                child: IndexedSemantics(
                  index: 1,
                  child: index <= 3
                      ? FlatButton(
                          onPressed: () => _pageController.animateToPage(
                            titles.length - 1,
                            duration: Duration(milliseconds: 10),
                            curve: Curves.linear,
                          ),
                          child: Text(
                            'PULAR',
                            style: TextStyle(
                              color: Color(0xFF00859B),
                              fontSize: 14.0,
                            ),
                            semanticsLabel: 'Pular apresentação do aplicativo. Página ${index + 1} de ${titles.length}',
                          ),
                        )
                      : SizedBox(),
                ),
              ),
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
          ],
        ),
      ),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          index > 0
              ? FlatButton(
                  onPressed: () => _pageController.previousPage(
                    duration: Duration(milliseconds: 10),
                    curve: Curves.linear,
                  ),
                  child: Text(
                    'ANTERIOR',
                    style: TextStyle(
                      color: Color(0xFF00859B),
                      fontSize: 16.0,
                    ),
                  ),
                )
              : SizedBox(),
          index < 4
              ? FlatButton(
                  onPressed: () => _pageController.nextPage(
                    duration: Duration(milliseconds: 10),
                    curve: Curves.linear,
                  ),
                  child: Text(
                    'PRÓXIMO',
                    style: TextStyle(
                      color: Color(0xFF00859B),
                      fontSize: 16.0,
                    ),
                  ),
                )
              : FlatButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRoutes.PRINCIPAL_PAGE);
                  },
                  child: Text(
                    'COMEÇAR',
                    style: TextStyle(
                      color: Color(0xFF00859B),
                      fontSize: 16.0,
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  Widget dot(index, i) {
    return Container(
      width: 10.0,
      height: 10.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: index == i ? Color(0xFF00859B) : Color(0xFFA5CAD1),
      ),
    );
  }
}
