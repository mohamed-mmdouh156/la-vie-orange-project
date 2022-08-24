import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:la_vie_orange/mobile/presentation/resources/value_manager.dart';
import 'package:la_vie_orange/mobile/presentation/styles/color_manager.dart';
import 'package:la_vie_orange/mobile/presentation/widget/button_manager.dart';

class QuestionsScreen extends StatelessWidget {
  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Course Exam',
          style: GoogleFonts.roboto(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            color: ColorManager.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Question',
                  style: GoogleFonts.roboto(
                    fontSize: AppSize.s35,
                    fontWeight: FontWeight.w500,
                    color: ColorManager.black,
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Text(
                  '1',
                  style: GoogleFonts.roboto(
                    fontSize: AppSize.s35,
                    fontWeight: FontWeight.w500,
                    color: ColorManager.primary,
                  ),
                ),
                Text(
                  '/10',
                  style: GoogleFonts.roboto(
                    fontSize: AppSize.s18,
                    fontWeight: FontWeight.w500,
                    color: ColorManager.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40.0,
            ),
            Text(
              'What is the user experience ?',
              style: GoogleFonts.roboto(
                fontSize: AppSize.s20,
                fontWeight: FontWeight.w500,
                color: ColorManager.black,
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            SizedBox(
              height: screenSize.height * 0.4,
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context , index)=> answerItem(),
                  separatorBuilder: (context , index)=> const SizedBox(
                    height: 40.0,
                  ),
                  itemCount: 3,
              ),
            ),
            ButtonManager(
                title: 'Next',
                function: (){},
            ),
          ],
        ),
      ),
    );
  }

  Widget answerItem ()
  {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          width: 2.0,
          color: ColorManager.primary,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                'What is the user experience ?',
                style: GoogleFonts.roboto(
                  fontSize: AppSize.s16,
                  fontWeight: FontWeight.w500,
                  color: ColorManager.black,
                ),
              ),
            ),
            const SizedBox(
              width: 5.0,
            ),
            IconButton(
              onPressed: (){},
              icon: Icon(
                Icons.circle_outlined,
                color: ColorManager.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }

}
