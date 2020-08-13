import 'package:flutter/material.dart';
import 'package:seus_olhos/classes/app_route.dart';
import 'package:seus_olhos/funcoes/menu_lateral.dart';
import 'package:seus_olhos/pages/imageLabel.dart';
import 'package:seus_olhos/widgets/widget_loader.dart';

class PagePrincipal extends StatefulWidget {
  @override
  _PagePrincipalState createState() => _PagePrincipalState();
}

class _PagePrincipalState extends State<PagePrincipal> {
  final IL = ImageLabels();
  String texto = '';
  bool _busy = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //onde fica a barra na parte de cima
      appBar: AppBar(
        backgroundColor: Color(0xFF00656B),
      ),
      drawer: MenuLateral(),
      body: Visibility(
        visible: this._busy,
        child: Loader(texto: 'Carregando informações, aguarde...'),
        replacement: Container(
          padding: EdgeInsets.all(20),
          child: Center(
            child: ListView(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: Color(0xFF75A8C0),
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.6),
                        offset: Offset(3.0, 3.0),
                        blurRadius: 5.0,
                      ),
                    ],
                  ),
                  child: FlatButton.icon(
                    icon: Icon(
                      Icons.monetization_on,
                      color: Colors.white,
                      size: 45.0,
                    ),
                    onPressed: () {},
                    label: Text(
                      'CÉDULAS',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFEA8F87),
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.6),
                        offset: Offset(3.0, 3.0),
                        blurRadius: 5.0,
                      ),
                    ],
                  ),
                  child: FlatButton.icon(
                    icon: Icon(
                      Icons.text_fields,
                      color: Colors.white,
                      size: 45.0,
                    ),
                    onPressed: () async {
                      this._busy = true;
                      String imageLabels = await IL.getImageFile();
                      Navigator.of(context).pushNamed(
                        AppRoutes.RESPOSTA_PAGE,
                        arguments: imageLabels,
                      );
                      setState(() {
                        this._busy = false;
                      });
                    },
                    label: Text(
                      'TEXTOS',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
