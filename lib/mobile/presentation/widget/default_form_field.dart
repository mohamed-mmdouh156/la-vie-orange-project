import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:la_vie_orange/mobile/presentation/styles/color_manager.dart';


class DefaultFormField extends StatelessWidget {

  final String? hint;
  final bool isPassword;
  final TextInputType ?textInputType;
  final TextEditingController controller;
  final IconData ?suffixIcon;
  final Function ?suffixFunction;
  final Widget? prefixWidget;
  final String validText;
  final Color ?color;

  const DefaultFormField({
    this.hint,
    required this.controller,
    this.textInputType,
    this.isPassword=false,
    this.suffixIcon,
    this.suffixFunction,
    this.prefixWidget,
    this.color=Colors.white,
    required this.validText,
    Key? key
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: color,
        hintText: hint,
        hintStyle: GoogleFonts.roboto(
            fontSize: 15.0,
            color: Colors.grey[400],
            fontWeight: FontWeight.w500
        ),
        border: OutlineInputBorder(
            borderSide: BorderSide(
                color: ColorManager.dartGrey,
                width: 1
            ),
            borderRadius: BorderRadius.circular(7)
        ),
        prefixIcon: prefixWidget,
        suffixIcon: IconButton(onPressed: (){suffixFunction!();}, icon: Icon(suffixIcon),color: Colors.grey.shade400,),
      ),
      style: GoogleFonts.roboto(
        color: Colors.black,
        fontSize: 15,
      ),
      controller: controller,
      keyboardType: textInputType,
      obscureText: isPassword,
      validator: (value){
        if(value!.isEmpty){
          return validText;
        }
        else
        {
          return null;
        }
      },
    );
  }
}