import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:la_vie_orange/mobile/presentation/styles/assets_manager.dart';
import 'package:la_vie_orange/mobile/presentation/styles/color_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CartSearchScreen extends StatelessWidget {
  const CartSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('My Cart',style: GoogleFonts.roboto(
          fontWeight: FontWeight.w700,
          fontSize: 22.px,
          color: ColorManager.black,
        ),),
      ),
      body:Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 15
            ),
            child: Row(
              children: [
                Text('Results for',style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w700,
                  fontSize: 20.px,
                  color: ColorManager.black,
                ),),
              Text(' " ',style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w700,
                  fontSize: 20.px,
                  color: ColorManager.black,
                ),),
                Text('Cactus Plant',style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w700,
                  fontSize: 20.px,
                  color: ColorManager.primary,
                ),),
                Text(' "',style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w700,
                  fontSize: 20.px,
                  color: ColorManager.black,
                ),),
                const Spacer(),
                Text('0 found',style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w700,
                  fontSize: 16.px,
                  color: ColorManager.primary,
                ),),
              ],
            ),
          ),
          SizedBox(height: 8.h,),
          Image(
              height: 35.h,
              width: 80.w,
              image: const AssetImage(AssetsManager.cartEmpty)
          ),
          const SizedBox(height: 15,),
          Text('Your cart is empty',style: GoogleFonts.roboto(
            fontWeight: FontWeight.w700,
            fontSize: 24.px,
            color: ColorManager.black,
          ),),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 12
            ),
            child: Text('Sorry, the keyword you entered cannot be \n found, please check again o r search with \n another keyword',style: GoogleFonts.roboto(
              fontWeight: FontWeight.w400,
              fontSize: 18.px,
              color: ColorManager.dartGrey,
            ),
              textAlign: TextAlign.center,
            ),
          ),

        ],
      ) ,
    );

  }
}
