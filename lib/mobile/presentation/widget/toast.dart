import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:la_vie_orange/mobile/presentation/styles/color_manager.dart';


customToast({
      required String title,
      required Color color
    })
{

  Fluttertoast.showToast(
      msg: title,
      textColor: ColorManager.white,
      backgroundColor: color,
      gravity: ToastGravity.BOTTOM
  );

}
