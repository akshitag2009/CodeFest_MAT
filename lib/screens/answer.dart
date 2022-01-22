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
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          Container(
            width: 300,
            height: 400,
            child:
            //Image.network("https://cdn.discordapp.com/attachments/923096091501666304/934304253122609152/Screenshot_2022-01-22_at_10.01.26_AM.png"),
            answer != null
                ? Image.network(
              answer!,
              fit: BoxFit.cover,
              width : double.infinity,
            )
                : Text('null', textAlign: TextAlign.center,),
            alignment: Alignment.center,
          ),
        ],
      ),
    );
  }
}

