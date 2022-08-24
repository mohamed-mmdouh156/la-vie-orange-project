import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:la_vie_orange/mobile/business_logic/app_cubit/app_cubit.dart';
import 'package:la_vie_orange/mobile/business_logic/app_cubit/app_state.dart';
import 'package:la_vie_orange/mobile/presentation/screens/mobile/change_email.dart';
import 'package:la_vie_orange/mobile/presentation/screens/mobile/change_name.dart';
import 'package:la_vie_orange/mobile/presentation/styles/assets_manager.dart';
import 'package:la_vie_orange/mobile/presentation/styles/color_manager.dart';
import 'package:la_vie_orange/mobile/presentation/widget/navigate_to.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){

      },
      builder: (context,state){
        var cubit=AppCubit.get(context);
        return Scaffold(
            body:cubit.currentUserModel!=null? Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(AssetsManager.userBackground)
                  )
              ),
              height: double.infinity,
              width: double.infinity,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Positioned(
                        top: 6.h,
                        left: 5.w,
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: ColorManager.white,
                          ),
                          onPressed: (){

                          },
                        ),
                      ),
                      Positioned(
                        top: 6.h,
                        right: 5.w,
                        child: IconButton(
                          icon: Icon(
                            Icons.more_horiz,
                            color: ColorManager.white,
                          ),
                          onPressed: (){

                          },
                        ),
                      ),

                      SizedBox(
                        height: 40.h,
                        width: double.infinity,
                      ),
                      Positioned(
                        top: 15.h,
                        left: 36.w,
                        child: CircleAvatar(
                          radius: 55,
                          backgroundColor: ColorManager.whiteDark,
                          backgroundImage: NetworkImage('${cubit.currentUserModel!.data!.imageUrl}'),

                        ),
                      ),
                      Positioned(
                        top: 33.h,
                        left: 20.w,
                        child: Text('${cubit.currentUserModel!.data!.firstName} ${cubit.currentUserModel!.data!.lastName}',style: GoogleFonts.roboto(
                            fontSize: 25.88.px,
                            fontWeight: FontWeight.w700,
                            color: ColorManager.white
                        ),),
                      ),

                    ],
                  ),
                  Expanded(child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: ColorManager.white,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(25, 35, 25, 10),
                          height: 70,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: ColorManager.white1,
                              borderRadius: BorderRadius.circular(7)
                          ),
                          child: Row(
                            children: [
                              const Image(
                                image: AssetImage(AssetsManager.pointIcon),
                              ),
                              const SizedBox(width: 10,),
                              Text('You have 300 points',style: GoogleFonts.roboto(
                                  fontSize: 15.88.px,
                                  fontWeight: FontWeight.w500,
                                  color: ColorManager.black
                              ),),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text('Edit Profile',style: GoogleFonts.roboto(
                                fontSize: 15.88.px,
                                fontWeight: FontWeight.w500,
                                color: ColorManager.black
                            ),),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(25, 25, 25, 10),
                          padding: const EdgeInsets.all(10),
                          height: 70,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: ColorManager.white,
                              border: Border.all(
                                  color: ColorManager.grey,
                                  width: 1
                              ),
                              borderRadius: BorderRadius.circular(7)
                          ),
                          child: Row(
                            children: [
                              const Image(
                                image: AssetImage(AssetsManager.changeIcon),
                              ),
                              const SizedBox(width: 10,),
                              Text('Change Name',style: GoogleFonts.openSans(
                                  fontSize: 17.88.px,
                                  fontWeight: FontWeight.w600,
                                  color: ColorManager.black
                              ),),
                              const Spacer(),
                              IconButton(
                                  onPressed: (){
                                    navigateTo(context,const ChangeName());
                                  },
                                  icon: Icon(
                                    Icons.arrow_forward,
                                    color: ColorManager.darkGreen,
                                  )
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(25, 15, 25, 20),
                          padding: const EdgeInsets.all(10),
                          height: 70,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: ColorManager.white,
                              border: Border.all(
                                  color: ColorManager.grey,
                                  width: 1
                              ),
                              borderRadius: BorderRadius.circular(7)
                          ),
                          child: Row(
                            children: [
                              const Image(
                                image: AssetImage(AssetsManager.changeIcon),
                              ),
                              const SizedBox(width: 10,),
                              Text('Change Email',style: GoogleFonts.openSans(
                                  fontSize: 17.88.px,
                                  fontWeight: FontWeight.w600,
                                  color: ColorManager.black
                              ),),
                              const Spacer(),
                              IconButton(
                                  onPressed: (){
                                    navigateTo(context,const ChangeEmail());

                                  },
                                  icon: Icon(
                                    Icons.arrow_forward,
                                    color: ColorManager.darkGreen,
                                  )
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                  )

                ],
              ),
            ):
            Center(
              child: CircularProgressIndicator(color: ColorManager.primary),
            )
        );
      },
    );
  }
}
