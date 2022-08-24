
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:la_vie_orange/mobile/presentation/screens/mobile/Login_register_screen.dart';
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 90,
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Text(
                      'La Vie',
                      style: GoogleFonts.meddon(
                        fontSize: 36.px,
                        color: ColorManager.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Align(
                      alignment: AlignmentDirectional.topCenter,
                      child: Padding(
                        padding: EdgeInsets.only(top: 25),
                        child: Image(
                          image: AssetImage(
                            AssetsManager.imageLogo,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}