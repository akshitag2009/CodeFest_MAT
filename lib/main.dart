import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:google_ml_vision/google_ml_vision.dart';
import 'package:http/http.dart';

import 'package:codefesttry2/screens/home.dart';
import 'package:codefesttry2/screens/questionDisplay.dart';
import 'package:codefesttry2/screens/answer.dart';


void main(){
  return runApp(MaterialApp(
    // home: Home2(),
    initialRoute: '/',
    routes: {
      '/': (context) => Home(),
      // '/questionDisplay': (context) => DisplayQuestion(),
    },
  ));
}
/*
class Home2 extends StatefulWidget {
  const Home2({Key? key}) : super(key: key);

  @override
  _Home2State createState() => _Home2State();
}

class _Home2State extends State<Home2> {

  String? hint;// = "https://cdn.discordapp.com/attachments/923096091501666304/934304253122609152/Screenshot_2022-01-22_at_10.01.26_AM.png";
  Future<void> _getHint() async {
    Response responseHint = await get(Uri.parse('https://mat.isro123.repl.co/gethint/$id'));
    setState(() {
      hint = responseHint.body;
      hint = hint!.replaceAll("\"", "");
      hint = hint!.trim();
     // hint  =  "https://cdn.discordapp.com/attachments/923096091501666304/934304253122609152/Screenshot_2022-01-22_at_10.01.26_AM.png";

    });
    print(hint);
  }

  String? answer;
  Future<void> _getAnswer() async {
    Response responseAnswer = await get(Uri.parse('https://mat.isro123.repl.co/getans/$id'));
    setState(() {
      answer = responseAnswer.body;
    });
    print(answer);
  }

  File? storedImage;

  Future<void> _takePicture() async {
    final picker = ImagePicker();
    final imageFile = await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    setState(() {
      print('set state called');
      storedImage = File(imageFile!.path);
    });
  }

  String? id;

  Future<void> _getText() async {
    print('AKS get text running');
    final GoogleVisionImage visionImage = GoogleVisionImage.fromFile(storedImage!);
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

          }

        }
      }
    }
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
      body: Column(
        children: <Widget>[
          Row(
             children: <Widget>[
               Container(
                 width: 150,
                 height: 200,
                 child: storedImage != null
                     ? Image.file(
                   storedImage!,
                   fit: BoxFit.cover,
                   width : double.infinity,
                 )
                     : Text('no image taken yet', textAlign: TextAlign.center,),
                 alignment: Alignment.center,
               ),
               ElevatedButton(
                 onPressed: _getText,
                 child: Text('extract text'),
               ),
             ],
          ),
          Row(
            children: <Widget>[
              ElevatedButton(
                onPressed: _getHint,
                child: Text('get hint'),
              ),
              SizedBox(
                width: 100,
              ),
              ElevatedButton(
                onPressed: _getAnswer,
                child: Text('get answer'),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: 150,
                height: 200,
                child:
                //Image.network("https://cdn.discordapp.com/attachments/923096091501666304/934304253122609152/Screenshot_2022-01-22_at_10.01.26_AM.png"),
                hint != null
                    ? Image.network(
                  hint!,
                  fit: BoxFit.cover,
                  width : double.infinity,
                )
                    : Text('null', textAlign: TextAlign.center,),
                alignment: Alignment.center,
              ),
              /*Container(
                width: 100,
                height: 150,
                child: answer != null
                    ? Image.network(
                  answer!,
                  fit: BoxFit.cover,
                  width : double.infinity,
                )
                    : Text('null', textAlign: TextAlign.center,),
                alignment: Alignment.center,
              ),*/
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: _takePicture,
          elevation: 2.0,
          child: Icon(Icons.photo_camera, size: 28)
      ),
    );
  }
}

*/







/*class Home extends StatelessWidget {

  File file = new File('./assets/images/image1.jpeg');

  Future<void> _takePicture() async {
    final picker = ImagePicker();
    final imageFile = await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('camera app'),
        centerTitle: true,
      ),
      body: Image.file(file),
      floatingActionButton: FloatingActionButton(
        onPressed: _takePicture,
        elevation: 2.0,
        child: Icon(Icons.photo_camera, size: 28)
      ),
    );
  }
}

 */
