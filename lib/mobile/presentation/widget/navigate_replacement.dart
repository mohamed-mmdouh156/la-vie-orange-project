import 'package:flutter/material.dart';

void navigateAndReplacement(context,widget){

  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_){
    return widget;
  }));

}