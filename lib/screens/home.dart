import 'package:codefesttry2/screens/questionDisplay.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:google_ml_vision/google_ml_vision.dart';
import 'package:http/http.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {

  File? _storedImage;

  Future<void> _takePicture() async {
    final picker = ImagePicker();
    final imageFile = await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    setState(() {
      print('set state called');
      _storedImage = File(imageFile!.path);
    });
  }


  String? id;

  Future<void> _getText() async {
    print('AKS get text running');
    final GoogleVisionImage visionImage = GoogleVisionImage.fromFile(_storedImage!);
    final TextRecognizer textRecognizer = GoogleVision.instance.textRecognizer();
    final VisionText visionText = await textRecognizer.processImage(visionImage);
    print('AKS variabled defined');

    String? text = visionText.text;
    print('AKS text defined');
    for (TextBlock block in visionText.blocks) {

      final Rect? boundingBox = block.boundingBox;
      final List<Offset> cornerPoints = block.cornerPoints;
      final String? text = block.text;
      final List<RecognizedLanguage> languages = block.recognizedLanguages;

      for (TextLine line in block.lines) {
        // Same getters as TextBlock
        for (TextElement element in line.elements) {
          // Same getters as TextBlock
          print("AKS ${element.text}");

          if (element.text == 'student') {
            id = 'student90';
            print("id=${id}");
          }

        }
      }
    }
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => DisplayQuestion(id: 'student90')));
    // Navigator.pushNamed(context, '/questionDisplay');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        titleTextStyle: TextStyle(
          fontSize: 30,
          color: Colors.white70,
          fontFamily: 'IndieFlower',
        ),
        centerTitle: true,
        backgroundColor: Colors.brown[400],
      ),
      body:
      Column(
        children: [
          Container(
            width: 300,
            height: 500,
            child: _storedImage != null
                ? Image.file(
              _storedImage!,
              fit: BoxFit.cover,
              width : double.infinity,
            )
                : Text('Your question will appear here.', textAlign: TextAlign.center,),
            alignment: Alignment.center,
          ),
          ElevatedButton(
            onPressed:_takePicture,
            child: Text(
              'Help Me',
              style: TextStyle(
                fontFamily: 'IndieFlower',
                fontSize: 25,
                color: Colors.white70,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: _getText,
            child: Text('Search for Answers'),
          ),
        ],
      ),
    );
  }
}
