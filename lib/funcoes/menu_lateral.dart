import 'package:flutter/material.dart';
import 'package:seus_olhos/classes/app_route.dart';

class MenuLateral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //parte do menu hamburguinho
    return Drawer(
      semanticLabel: 'Menu lateral expandido',
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.3, 1.0],
            colors: [Color(0xFF00656B), Color(0xFF0084A1)],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              Align(
                alignment: Alignment.centerRight,
                child: FlatButton.icon(
                  onPressed: () {
                    //atributo que fecha o menu
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.close,
                    size: 23.0,
                    color: Colors.white,
                  ),
                  label: Text(
                    'FECHAR',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
              Divider(
                color: Colors.white12,
                height: 2,
                thickness: 1,
              ),
              SizedBox(
                height: 170,
              ),
              ListTile(
                leading: SizedBox(
                  height: 30.0,
                  width: 30.0,
                  child: Image.asset('assets/images/help.png'),
                ),
                title: Text(
                  'AJUDA',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                onTap: () {
                  //ao retornar da página fecha o menu hamburguinho
                  Navigator.of(context).pop();
                  //constroi a página de ajuda
                  Navigator.of(context).pushNamed(AppRoutes.AJUDA_PAGE);
                  // Navigator.push(context, new MaterialPageRoute(
                  //   builder: (BuildContext context) => Ajuda()),
                  // );
                },
              ),
              Divider(
                color: Colors.white12,
                height: 5,
                thickness: 1,
              ),
              ListTile(
                leading: SizedBox(
                  height: 30,
                  width: 30,
                  child: Image.asset('assets/images/info.png'),
                ),
                title: Text(
                  'SOBRE NÓS',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                onTap: () {
                  //ao retornar da página fecha o menu hamburguinho
                  Navigator.of(context).pop();

                  //constroi a pagina sobre nos
                  Navigator.of(context).pushNamed(AppRoutes.SOBRE_PAGE);
                  // Navigator.push(context, new MaterialPageRoute(
                  //   builder: (BuildContext context) => Sobre_Nos()),
                  // );
                },
              ),
              Divider(
                color: Colors.white12,
                height: 5,
                thickness: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
