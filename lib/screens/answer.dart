import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:google_ml_vision/google_ml_vision.dart';
import 'package:http/http.dart';

import 'package:codefesttry2/screens/home.dart';


class DisplayAnswer extends StatefulWidget {
  String id;
  DisplayAnswer({required this.id});

  @override
  _DisplayAnswerState createState() => _DisplayAnswerState();
}

class _DisplayAnswerState extends State<DisplayAnswer> {

  @override
  void initState()
  {
    _getAnswer();
    super.initState();
  }

  String? answer;
  Future<void> _getAnswer() async {
    print("getanswer called");

    print("id=${widget.id}");
    Response responseAnswer = await get(
        Uri.parse('https://mat.isro123.repl.co/getans/${widget.id}'));
    setState(() {
      answer = responseAnswer.body;
      answer = answer!.replaceAll("\"", "");
      answer = answer!.trim();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MAT help'),
        titleTextStyle: TextStyle(
          fontSize: 25,
        ),
        centerTitle: true,

      ),
      body:
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          Container(
            width: 400,
            height: 500,
            child:
            //Image.network("https://cdn.discordapp.com/attachments/923096091501666304/934304253122609152/Screenshot_2022-01-22_at_10.01.26_AM.png"),
            answer != null
                ? Image.network(
              answer!,
              fit: BoxFit.cover,
              width : double.infinity,
            )
                : Text(
              'Loading complete answer',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }
}

