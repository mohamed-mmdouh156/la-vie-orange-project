import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:la_vie_orange/mobile/business_logic/user_data_cubit/user_data_cubit.dart';
import 'package:la_vie_orange/mobile/business_logic/user_data_cubit/user_data_state.dart';
import 'package:la_vie_orange/mobile/presentation/screens/mobile/reset_password_screen.dart';
import 'package:la_vie_orange/mobile/presentation/styles/assets_manager.dart';
import 'package:la_vie_orange/mobile/presentation/styles/color_manager.dart';
import 'package:la_vie_orange/mobile/presentation/widget/button_manager.dart';
import 'package:la_vie_orange/mobile/presentation/widget/navigate_to.dart';
import 'package:la_vie_orange/mobile/presentation/widget/toast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class VerifyEmailScreen extends StatelessWidget {
  VerifyEmailScreen({Key? key,this.email}) : super(key: key);

  String ?email;
  var otpController1=TextEditingController();
  var otpController2=TextEditingController();
  var otpController3=TextEditingController();
  var otpController4=TextEditingController();
  var otpController5=TextEditingController();
  var otpController6=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserDataCubit,UserDataStates>(
      listener: (context,state){
        if(state is VerifiyOTPSuccessState){
          customToast(title: 'Correct OTP', color: ColorManager.primary);
          navigateTo(context,ResetPasswordScreen(email: email,otpCode: otpController1.text+otpController2.text+otpController3.text+
              otpController4.text+otpController5.text+otpController6.text,) );
        }
        if (state is VerifiyOTPErrorState){
          customToast(title: 'OTP isn\'t correct', color: ColorManager.red);

        }


      },
      builder: (context,state){
        var cubit= UserDataCubit.get(context);
        return Scaffold(
          appBar: AppBar(
              leading: IconButton(
                onPressed: (){

                },
                icon: const Icon(
                    Icons.arrow_back_outlined
                ),
                color: ColorManager.black,
              ),
              centerTitle: true,
              title: Text('Verify Email',style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 20.px,
                color: ColorManager.black,
              ),)
          ),
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children:  [
                  SizedBox(height: 13.h,),
                  Image(
                    height: 20.h,
                    width: double.infinity,
                    image: const AssetImage(AssetsManager.verifiyEmail),
                  ),
                  SizedBox(height: 7.h,),
                  Text('Please enter the 6-digit code sent to',style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.px,
                    color: ColorManager.black,
                  ),
                    textAlign: TextAlign.center,

                  ),
                  const SizedBox(height: 15,),
                  Text('$email',style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w600,
                    fontSize: 16.px,
                    color: ColorManager.primary,
                  ),
                    textAlign: TextAlign.center,

                  ),
                  const SizedBox(height: 25,),
                  Row(
                    
                    children: [
                      const SizedBox(width: 15,),
                      SizedBox(

                        height: 7.h,
                        width: 7.h,
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintStyle: GoogleFonts.roboto(
                                fontSize: 15.0,
                                color: Colors.grey[600],
                                fontWeight: FontWeight.w500,
                            ),
                            filled: true,
                            fillColor: ColorManager.whiteDark,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10)
                            ),

                          ),
                          style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                          controller: otpController1,
                          keyboardType: TextInputType.number,
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Please enter your otp';
                            }
                            else
                            {
                              return null;
                            }
                          },
                        ),
                      ),
                      const SizedBox(width: 5,),
                      SizedBox(

                        height: 7.h,
                        width: 7.h,
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintStyle: GoogleFonts.roboto(
                              fontSize: 15.0,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w500,
                            ),
                            filled: true,
                            fillColor: ColorManager.whiteDark,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10)
                            ),

                          ),
                          style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                          controller: otpController2,
                          keyboardType: TextInputType.number,
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Please enter your otp';
                            }
                            else
                            {
                              return null;
                            }
                          },
                        ),
                      ),
                      const SizedBox(width: 5,),

                      SizedBox(

                        height: 7.h,
                        width: 7.h,
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintStyle: GoogleFonts.roboto(
                              fontSize: 15.0,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w500,
                            ),
                            filled: true,
                            fillColor: ColorManager.whiteDark,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10)
                            ),

                          ),
                          style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                          controller: otpController3,
                          keyboardType: TextInputType.number,
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Please enter your otp';
                            }
                            else
                            {
                              return null;
                            }
                          },
                        ),
                      ),
                      const SizedBox(width: 5,),

                      SizedBox(

                        height: 7.h,
                        width: 7.h,
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintStyle: GoogleFonts.roboto(
                              fontSize: 15.0,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w500,
                            ),
                            filled: true,
                            fillColor: ColorManager.whiteDark,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10)
                            ),

                          ),
                          style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                          controller: otpController4,
                          keyboardType: TextInputType.number,
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Please enter your otp';
                            }
                            else
                            {
                              return null;
                            }
                          },
                        ),
                      ),
                      const SizedBox(width: 5,),

                      SizedBox(

                        height: 7.h,
                        width: 7.h,
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintStyle: GoogleFonts.roboto(
                              fontSize: 15.0,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w500,
                            ),
                            filled: true,
                            fillColor: ColorManager.whiteDark,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10)
                            ),

                          ),
                          style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                          controller: otpController5,
                          keyboardType: TextInputType.number,
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Please enter your otp';
                            }
                            else
                            {
                              return null;
                            }
                          },
                        ),
                      ),
                      const SizedBox(width: 5,),

                      SizedBox(

                        height: 7.h,
                        width: 7.h,
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintStyle: GoogleFonts.roboto(
                              fontSize: 15.0,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w500,
                            ),
                            filled: true,
                            fillColor: ColorManager.whiteDark,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10)
                            ),

                          ),
                          style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                          controller: otpController6,
                          keyboardType: TextInputType.number,
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Please enter your otp';
                            }
                            else
                            {
                              return null;
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 5,),


                    ],
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 15
                    ),
                    width: double.infinity,
                    height: 13.h,
                    child: ButtonManager(
                      title: 'verify',
                      function: (){
                        cubit.verifiyOtp(
                            email: email!,
                            otpCode: otpController1.text+otpController2.text+otpController3.text+
                            otpController4.text+otpController5.text+otpController6.text
                        );
                      },
                    ),
                  )

                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
