import 'package:flutter/material.dart';

Future navigateTo(context,widget)async{

  Navigator.push(context, MaterialPageRoute(builder: (_){
    return widget;
  }));
}