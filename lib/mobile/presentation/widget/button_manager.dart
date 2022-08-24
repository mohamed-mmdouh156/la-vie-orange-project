import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:la_vie_orange/mobile/presentation/styles/color_manager.dart';



class ButtonManager extends StatelessWidget {
  const ButtonManager(
      {
        Key? key,
        required this.title,
        required this.function,

        this.size=16,

      }
      ) : super(key: key);

  final String title;
  final Function function;
  final double size;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 0
      ),
      child: MaterialButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 14,
        ),
        color: ColorManager.primary,
        onPressed: (){
          function();
        },
        child: Text(title,style: GoogleFonts.roboto(
            fontSize: size,
            fontWeight: FontWeight.w500,
            color: ColorManager.white
        ),),
      ),
    );
  }
}