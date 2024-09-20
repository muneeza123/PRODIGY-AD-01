import 'dart:ffi';

import 'package:flutter/material.dart';

class DisplayResult  extends StatelessWidget {
  String text;

DisplayResult({required this.text});

 @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          alignment: Alignment.bottomRight,
          color: Colors.black,
          width:1350,
          height:150,
        
          child:Padding(
            padding: const EdgeInsets.only(bottom: 24,right: 24),
            child: Text(text,style: TextStyle(fontSize: 25,fontWeight: FontWeight.w400,color: Colors.white),
            textAlign: TextAlign.end,),
          )
        
      ),
    );
  }
}
