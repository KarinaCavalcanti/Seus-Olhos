import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImageLabels {
  final TextRecognizer textRecognizer = FirebaseVision.instance.textRecognizer();

  openImage() async {
    String response = await getImageFile();
    return response;
  }

  getImageFile() async {
    File file = await ImagePicker.pickImage(source: ImageSource.camera);
    String text;

    try {
      FirebaseVisionImage visionImage = FirebaseVisionImage.fromFile(file);
      VisionText visionText = await textRecognizer.processImage(visionImage);

       text = visionText.text;
      
    } catch(e) {
      text = 'Algo deu errado... Tente novamente!';
    }

    if(text.isEmpty) {
      return "Não foi possível reconhecer!";
    } else {
      return text;
    }
  }
}

