import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:la_vie_orange/mobile/presentation/styles/assets_manager.dart';
import 'package:la_vie_orange/mobile/presentation/styles/color_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BlogsDetailsScreen extends StatelessWidget {
  BlogsDetailsScreen({Key? key,this.model}) : super(key: key);

  var model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            model.imageUrl==""?

            Image(
              image: const AssetImage(AssetsManager.imageTest),
              height: 38.h,
              width: double.infinity,
              fit: BoxFit.cover,

            ):Container(

              child: Image(
                image: NetworkImage('https://lavie.orangedigitalcenteregypt.com${model.imageUrl}'),
                height: 38.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('${model.name}',style: GoogleFonts.roboto(
                fontWeight: FontWeight.w600,
                fontSize: 23.px,
                color: ColorManager.black,
              ),

              ),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('${model.description}',style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 16.px,
                color: ColorManager.lightGrey,
              ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
