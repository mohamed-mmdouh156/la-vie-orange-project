
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:la_vie_orange/mobile/presentation/screens/mobile/user_data__screen.dart';
import 'package:la_vie_orange/mobile/presentation/styles/assets_manager.dart';
import 'package:la_vie_orange/mobile/presentation/styles/color_manager.dart';
import 'package:la_vie_orange/mobile/presentation/widget/navigate_replacement.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  
  @override
  void initState() {

    Future.delayed(const Duration(seconds: 2),(){
      return navigateAndReplacement(context, UserDataScreen());
    });

    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return  Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
          toolbarHeight: 0.0,
      ),
      body: SafeArea(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
               
              Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text('La Vie',style: GoogleFonts.meddon(
                      fontSize: 36.px,
                      color: ColorManager.black,
                      fontWeight: FontWeight.w400,
                      height: 15.px
                    ),),
                  ),
                  Positioned(
                    top: size.height*.46,
                    left: size.width*.46,
                    child: const Image(
                      image: AssetImage(AssetsManager.imageLogo),
                    ),
                  ),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}