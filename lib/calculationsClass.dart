import 'package:calculatorapp/result.dart';
import 'package:flutter/material.dart';


class Calculations extends StatelessWidget {
  final String label;
 
  final Color? BackgroundColor;
  final Color? labelColor;
  final VoidCallback onTap;

  Calculations({required this.BackgroundColor,required this.labelColor,required this.label,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(padding:EdgeInsets.all(12.0),
    child: Container(
      width:70,
      height:50,
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: BackgroundColor),
    child: InkWell(onTap:onTap,
      child: Center(child: Text(label,style: TextStyle(fontSize: 24,color: labelColor),))),
    ),

    );
  }







}