import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:google_ml_vision/google_ml_vision.dart';
import 'package:http/http.dart';

import 'package:codefesttry2/screens/home.dart';




class DisplayQuestion extends StatefulWidget {
  String id;
  DisplayQuestion({required this.id});

  @override
  _DisplayQuestionState createState() => _DisplayQuestionState();
}



class _DisplayQuestionState extends State<DisplayQuestion> {

  @override
  void initState()
  {
    _getHint();
    super.initState();
  }

  String? hint;// = "https://cdn.discordapp.com/attachments/923096091501666304/934304253122609152/Screenshot_2022-01-22_at_10.01.26_AM.png";
  Future<void> _getHint() async {
    print("gethint called");

    print("id=${widget.id}");
    Response responseHint = await get(Uri.parse('https://mat.isro123.repl.co/gethint/${widget.id}'));
    setState(() {
      hint = responseHint.body;
      hint = hint!.replaceAll("\"", "");
      hint = hint!.trim();
      // hint  =  "https://cdn.discordapp.com/attachments/923096091501666304/934304253122609152/Screenshot_2022-01-22_at_10.01.26_AM.png";

    });
    print("hint=${hint}");
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
      body:Container(
        width: 500,
        height: 600,
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
    );
  }
}

