import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:la_vie_orange/mobile/presentation/resources/value_manager.dart';
import 'package:la_vie_orange/mobile/presentation/styles/assets_manager.dart';
import 'package:la_vie_orange/mobile/presentation/styles/color_manager.dart';
import 'package:la_vie_orange/mobile/presentation/widget/button_manager.dart';

class QrReaderScreen extends StatelessWidget {
  const QrReaderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Stack(
            alignment: AlignmentDirectional.topCenter,
            children: [
              Image(
                image: const AssetImage(AssetsManager.scanReaderScreenBackground),
                height: screenSize.height * 0.5,
                width: screenSize.width * 1,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(
                height: screenSize.height * 0.4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40.0,
                        vertical: 10.0,
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(AppSize.s12),
                              color: ColorManager.black.withOpacity(0.5),
                            ),
                            child: Icon(
                              Icons.wb_sunny_outlined,
                              color: ColorManager.white,
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '78 %',
                                style: GoogleFonts.roboto(
                                  fontSize: AppSize.s22,
                                  fontWeight: FontWeight.w600,
                                  color: ColorManager.white,
                                ),
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                'Sun Light',
                                style: GoogleFonts.roboto(
                                  fontSize: AppSize.s14,
                                  fontWeight: FontWeight.w500,
                                  color: ColorManager.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40.0,
                        vertical: 10.0,
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(AppSize.s12),
                              color: ColorManager.black.withOpacity(0.5),
                            ),
                            child: Icon(
                              Icons.water_drop_outlined,
                              color: ColorManager.white,
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '10 %',
                                style: GoogleFonts.roboto(
                                  fontSize: AppSize.s22,
                                  fontWeight: FontWeight.w600,
                                  color: ColorManager.white,
                                ),
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                'Water Capacity',
                                style: GoogleFonts.roboto(
                                  fontSize: AppSize.s14,
                                  fontWeight: FontWeight.w500,
                                  color: ColorManager.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40.0,
                        vertical: 10.0,
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(AppSize.s12),
                              color: ColorManager.black.withOpacity(0.5),
                            ),
                            child: Icon(
                              Icons.device_thermostat,
                              color: ColorManager.white,
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '29 C',
                                style: GoogleFonts.roboto(
                                  fontSize: AppSize.s22,
                                  fontWeight: FontWeight.w600,
                                  color: ColorManager.white,
                                ),
                              ),
                              const SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                'Temperature',
                                style: GoogleFonts.roboto(
                                  fontSize: AppSize.s14,
                                  fontWeight: FontWeight.w500,
                                  color: ColorManager.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Container(
              height: screenSize.height * 0.6,
              decoration:  BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(AppSize.s22),
                  topLeft: Radius.circular(AppSize.s22),
                ),
                color: ColorManager.white,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 20.0
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'SNAKE PLANT (SANSEVIERIA)',
                      style: GoogleFonts.roboto(
                        fontSize: AppSize.s22,
                        fontWeight: FontWeight.w600,
                        color: ColorManager.black,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Native to southem Africa snake plants are well '
                          'adopted to conditions senior to those in southern regions of the United States.'
                          ' Because of this, ther may be grown outdoors for part of cs of use year in USDA zones 3 and warmer',
                      style: GoogleFonts.roboto(
                        fontSize: AppSize.s14,
                        fontWeight: FontWeight.w500,
                        color: ColorManager.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Common Snake Plant Diseases',
                      style: GoogleFonts.roboto(
                        fontSize: AppSize.s22,
                        fontWeight: FontWeight.w600,
                        color: ColorManager.black,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'A widespread problem with enake plants is root rot. This results from over watering the soil of the plant'
                          ' and is most common in the calder months of the year. When room rot occurs, the plant roots con die due'
                          ' to a lack of oxygen and an overgrowth offungus within the soil. If the snake plant\'s sail is soggy.'
                          ' certain microorganisms such as whitectonic.',
                      style: GoogleFonts.roboto(
                        fontSize: AppSize.s14,
                        fontWeight: FontWeight.w500,
                        color: ColorManager.grey,
                      ),
                    ),
                    const Spacer(),
                    ButtonManager(
                        title: 'Go to blog',
                        function: (){},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
