import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:la_vie_orange/mobile/business_logic/app_cubit/app_cubit.dart';
import 'package:la_vie_orange/mobile/business_logic/app_cubit/app_state.dart';
import 'package:la_vie_orange/mobile/presentation/styles/assets_manager.dart';
import 'package:la_vie_orange/mobile/presentation/styles/color_manager.dart';
import 'package:la_vie_orange/mobile/presentation/widget/defualt_button.dart';
import 'package:la_vie_orange/mobile/presentation/widget/default_form_field.dart';
import 'package:la_vie_orange/mobile/presentation/widget/toast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){
        
        if(state is UpdateCurrentUserNameSuccessState){
          
          customToast(title: 'User updated successfully', color: ColorManager.gold);
          
        }

      },
      builder: (context,state){
        var cubit=AppCubit.get(context);
        return Scaffold(
          backgroundColor: ColorManager.white,
          body: cubit.currentUserModel!=null? Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(AssetsManager.userBackground)
                )
            ),
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
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
                            Navigator.pop(context);
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
                  Container(
                    width: double.infinity,
                    height: 62.h,
                    decoration: BoxDecoration(
                      color: ColorManager.white,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 5.h,),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text('Edit UserName',style: GoogleFonts.roboto(
                                fontSize: 17.88.px,
                                fontWeight: FontWeight.w500,
                                color: ColorManager.black
                            ),),
                          ),
                        ),
                        SizedBox(height: 5.h,),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),

                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text('First Name',style: GoogleFonts.roboto(
                                fontSize: 17.88.px,
                                fontWeight: FontWeight.w500,
                                color: ColorManager.primary
                            ),),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(10),
                          height: 70,
                          width: double.infinity,
                          child: DefaultFormField(
                              controller: cubit.currentFirstNameController,
                              validText: 'please enter your firstName'
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),

                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text('Last Name',style: GoogleFonts.roboto(
                                fontSize: 17.88.px,
                                fontWeight: FontWeight.w500,
                                color: ColorManager.primary
                            ),),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(10),
                          height: 70,
                          width: double.infinity,
                          child: DefaultFormField(
                              controller: cubit.currentLastNameController,
                              validText: 'please enter your lastName'
                          ),
                        ),
                        state is UpdateCurrentUserNameLoadingState?
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircularProgressIndicator(
                            color: ColorManager.primary,
                          ),
                        ):
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10
                          ),
                          height: 12.h,
                          width: double.infinity,
                          child: DefaultButton(
                              title: 'Update',
                              function: (){
                                 cubit.updateCurrentUserName(
                                     cubit.currentFirstNameController.text,
                                     cubit.currentLastNameController.text
                                 );
                              }
                          ),
                        )
                      ],
                    ),
                  )

                ],
              ),
            ),
          ):
          Center(
          child: CircularProgressIndicator(color: ColorManager.primary),
          ),
        );
      },
    );
  }
}
