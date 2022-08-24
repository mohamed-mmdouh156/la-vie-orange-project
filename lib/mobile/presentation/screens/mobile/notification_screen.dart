import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:la_vie_orange/mobile/presentation/resources/font_manager.dart';
import 'package:la_vie_orange/mobile/presentation/styles/assets_manager.dart';
import 'package:la_vie_orange/mobile/presentation/styles/color_manager.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Notification',
          style: GoogleFonts.roboto(
            fontSize: 19.0,
            fontWeight: FontWeight.w500,
            color: ColorManager.black,
          ),
        ),
      ),
      body: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context , index) => index %2 == 0 ? notificationItemWithoutComment() : notificationItemWithComment (),
          separatorBuilder: (context , index) => Padding(
            padding: const EdgeInsets.symmetric(
                vertical: 10,
            ),
            child: Container(
              height: 1.0,
              width: double.infinity,
              color: ColorManager.lightGrey,
            ),
          ),
          itemCount: 10,
      ),
    );
  }

  Widget notificationItemWithoutComment (){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: 40,
        child: Row(
          crossAxisAlignment : CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage(AssetsManager.notificationScreenItem),
              radius: 16.0,
            ),
            const SizedBox(
              width: 16.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Joy Arnold left 6 comments on Your Post',
                  style: GoogleFonts.roboto(
                    fontSize: FontSize.s14,
                    fontWeight: FontWeight.w500,
                    color: ColorManager.black,
                  ),
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Text(
                  'Yesterday at 11:42 PM',
                  style: GoogleFonts.roboto(
                    fontSize: FontSize.s14,
                    fontWeight: FontWeight.w400,
                    color: ColorManager.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget notificationItemWithComment (){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: 134,
        child: Row(
          crossAxisAlignment : CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage(AssetsManager.notificationScreenItem),
              radius: 16.0,
            ),
            const SizedBox(
              width: 16.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Dennis Nedry commented on Isla Nublar SOC2 compliance report',
                    style: GoogleFonts.roboto(
                      fontSize: FontSize.s14,
                      fontWeight: FontWeight.w500,
                      color: ColorManager.black,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Container(
                    height: 70.0,
                    decoration: BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          width: 4.0,
                          color: ColorManager.lightGrey,
                        )
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        'leaves are an integral part of the stem system. They are attached by a continuous vascular system to the rest of the plant so that free exchange of nutrients.',
                        style: GoogleFonts.roboto(
                          fontSize: FontSize.s14,
                          fontWeight: FontWeight.w500,
                          color: ColorManager.black,
                        ),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    'Yesterday at 11:42 PM',
                    style: GoogleFonts.roboto(
                      fontSize: FontSize.s14,
                      fontWeight: FontWeight.w400,
                      color: ColorManager.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
