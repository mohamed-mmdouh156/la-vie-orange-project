import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:la_vie_orange/mobile/business_logic/user_data_cubit/user_data_cubit.dart';
import 'package:la_vie_orange/mobile/business_logic/user_data_cubit/user_data_state.dart';
import 'package:la_vie_orange/mobile/presentation/styles/assets_manager.dart';
import 'package:la_vie_orange/mobile/presentation/styles/color_manager.dart';
import 'package:la_vie_orange/mobile/presentation/widget/defualt_button.dart';
import 'package:la_vie_orange/mobile/presentation/widget/toast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({Key? key,this.otpCode,this.email}) : super(key: key);

  String ?otpCode;
  String ?email;

  var passwordController=TextEditingController();
  var confirmPasswordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserDataCubit,UserDataStates>(
      listener: (context,state){
        if(state is ResetPasswordSuccessState){
          customToast(title: 'Reset Password Successfully', color: ColorManager.primary);
          // navigateTo(context, );
        }
        if (state is VerifiyOTPErrorState){
          customToast(title: 'Incorrect OTP', color: ColorManager.red);

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
              title: Text('Reset Password',style: GoogleFonts.inter(
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
                    image: const AssetImage(AssetsManager.open),
                  ),
                  SizedBox(height: 7.h,),
                  Text('Enter Your New Password',style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w600,
                    fontSize: 18.px,
                    color: ColorManager.black,
                  ),
                    textAlign: TextAlign.center,

                  ),

                  const SizedBox(height: 25,),
                  Column(

                    children: [
                      Container(

                        padding: const EdgeInsets.symmetric(
                            horizontal: 25
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'New Password',
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
                          controller: passwordController,
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Please enter your new password';
                            }
                            else
                            {
                              return null;
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 10,),
                      Container(

                        padding: const EdgeInsets.symmetric(
                            horizontal: 25
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText:'Confirm password',
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
                          controller: confirmPasswordController,
                          keyboardType: TextInputType.visiblePassword,
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Please enter your new password';
                            }
                            else
                            {
                              return null;
                            }
                          },
                        ),
                      ),



                    ],
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 15
                    ),
                    width: double.infinity,
                    height: 13.h,
                    child: DefaultButton(
                      title: 'Submit',
                      function: (){
                        cubit.resetPassword(
                            email: email!,
                            otpCode: otpCode!,
                            password: passwordController.text
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
