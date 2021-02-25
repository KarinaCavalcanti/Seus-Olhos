import 'package:flutter/material.dart';

class Ajuda extends StatefulWidget {
  @override
  _AjudaState createState() => _AjudaState();
}

class _AjudaState extends State<Ajuda> {
  
  PageController controller = PageController(initialPage: 0,  keepPage: false);
  int index = 0;
  List<String> titles = [
    'Identifique cédulas de real ',
    'Reconheça textos ',
  ];

  List<String> texts = [
    'Para começar a reconhecer cédulas de real:'+'\n'+
    '- Selecione a opção CÉDULAS '+'\n'+
    '- Tire uma foto e pronto!'+'\n'+
    '(Será permitida apenas uma cédula por vez!)',

    'Para começar a reconhecer pequenos textos:'+'\n'+
     '- Selecione a opção TEXTOS '+'\n'+
     '- Tire uma foto e pronto! '+'\n'+
  '(Não serão permitidos textos manuscritos!)'
  ];
  List<String> imagens = [
    'c3',
    'c4',
  ];
  List<String> desc = [
    'Uma mão segurando uma cédula de dinheiro',
    'Uma pilha de papéis com informações'
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.white,
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
      
      body: SafeArea(
          child: Stack(
            children: <Widget>[
              PageView.builder(
                onPageChanged: (val){
                  setState(() {
                    index=val;
                  });
                },
                controller: controller,
                itemCount: titles.length,
                itemBuilder: (BuildContext ctx, position){
                  return Container(
                    width: MediaQuery.of(ctx).size.width,
                    height: MediaQuery.of(ctx).size.height,
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[

                          IndexedSemantics(
                            index: 0,
                            child: Text(     
                              '${titles[position]}',
                              style: TextStyle(
                                color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),

                        SizedBox(height: 30,),

                          IndexedSemantics(
                            index: 0,
                            child: Semantics(
                              child: Image(
                                image: AssetImage('assets/images/${imagens[position]}.png'),
                                width: 150.0,
                                height: 150.0,
                              ),
                              label: '${desc[position]}',
                            ),
                          ),
                        
                        SizedBox(height: 20,),

                          IndexedSemantics(
                            index: 0,
                            child: Text(
                              '${texts[position]}',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16.0,
                              ),   
                            ),
                          ),



                        ],
                      ),
                    ),
                  );
                },

              ),
              Positioned(
                bottom: 80,
                left: 0,
                right: 0,

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    dot(index,0),
                    SizedBox( width: 5,),
                    dot(index,1),
                  ],
                  
                ),
              ),
            ],
          ),
        ),

         bottomSheet: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    index >0?
                    FlatButton(
                      onPressed: ()=> controller.previousPage(duration: Duration(milliseconds: 300), curve: Curves.linear),
                      child: Text('ANTERIOR', style: TextStyle(color:Color(0xFF00656B), fontSize: 16),),
                    ):SizedBox(),
                    index !=1 ?
                    FlatButton(
                      onPressed: ()=> controller.nextPage(duration: Duration(milliseconds: 300), curve: Curves.linear),
                      child: Text('PRÓXIMO', style: TextStyle(color: Color(0xFF00656B), fontSize: 16),),
                    ):FlatButton(
                       onPressed: (){
                         //ao retornar da página fecha o menu hamburguinho
                         Navigator.of(context).pop();
                       },
                      child: Text('FINALIZAR', style: TextStyle(color: Color(0xFF00656B), fontSize: 16),),
                    ),
                  ],
                ),



    );
  }
   Widget dot(index, i){
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color:index==i? Color(0xFF00656B) : Colors.black12,
      ),
    );
  }

}

