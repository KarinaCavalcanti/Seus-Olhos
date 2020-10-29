import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:seus_olhos/classes/app_route.dart';
import 'package:seus_olhos/funcoes/menu_lateral.dart';
import 'package:seus_olhos/pages/imageLabel.dart';
import 'package:seus_olhos/widgets/widget_loader.dart';
import 'dart:io';
import 'package:tflite/tflite.dart';

class PagePrincipal extends StatefulWidget {
  @override
  _PagePrincipalState createState() => _PagePrincipalState();
}

class _PagePrincipalState extends State<PagePrincipal> {
  final IL = ImageLabels();
  String texto = '';
  bool _busy = false;
  bool _isLoading;
  File _image;
  List _output;
  var another_output;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadModel().then((value) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //onde fica a barra na parte de cima
      appBar: AppBar(
        backgroundColor: Color(0xFF00656B),
        title: Text(
          'PÁGINA PRINCIPAL',
          style: TextStyle(fontSize: 16.0),
        ),
        centerTitle: true,
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
                    color: Color(0xFF00966C),
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        offset: Offset(1.0, 2.0),
                        blurRadius: 2.0,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/icon-money.png',
                        width: 50.0,
                        height: 50.0,
                      ),
                      FlatButton(
                        onPressed: () async {
                          _output = await chooseImage(); 
                          Navigator.of(context)
                              .pushNamed(
                            AppRoutes.RESPOSTAIMGRECOG_PAGE,
                            arguments: _output,
                          )
                              .then((retorno) {
                            setState(() {
                              this._busy = false;
                            });
                          });
                        },
                        child: Text(
                          'CÉDULAS',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: Color(0xFF007396),
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        offset: Offset(1.0, 2.0),
                        blurRadius: 2.0,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/icon-text.png',
                        width: 50.0,
                        height: 50.0,
                      ),
                      FlatButton(
                        onPressed: () async {
                          setState(() {
                            this._busy = true;
                          });

                          String imageLabels = await IL.getImageFile();

                          Navigator.of(context)
                              .pushNamed(
                            AppRoutes.RESPOSTA_PAGE,
                            arguments: imageLabels,
                          )
                              .then((retorno) {
                            setState(() {
                              this._busy = false;
                            });
                          });
                        },
                        child: Text(
                          'TEXTOS',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
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

  runModelOnImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      imageMean: 127.5,
      imageStd: 127.5,
      threshold: 0.5,
    );
    return output; 
    setState(() {
      _isLoading = false;
      _busy = false;
    });
  }

  chooseImage() async {
    setState(() {
      _busy = true;
    });
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    if (image == null) return null;
    setState(() {
      _isLoading = true;
      _image = image;
    });
    another_output = runModelOnImage(image);
    return another_output;
  }

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/model_unquant.tflite",
      labels: "assets/labels.txt",
    );
  }
}

