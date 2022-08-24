import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:la_vie_orange/mobile/business_logic/user_data_cubit/user_data_cubit.dart';
import 'package:la_vie_orange/mobile/business_logic/user_data_cubit/user_data_state.dart';
import 'package:la_vie_orange/mobile/presentation/screens/mobile/verify_email_screen.dart';
import 'package:la_vie_orange/mobile/presentation/styles/assets_manager.dart';
import 'package:la_vie_orange/mobile/presentation/styles/color_manager.dart';
import 'package:la_vie_orange/mobile/presentation/widget/button_manager.dart';
import 'package:la_vie_orange/mobile/presentation/widget/navigate_to.dart';
import 'package:la_vie_orange/mobile/presentation/widget/toast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({Key? key}) : super(key: key);

  var emailController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserDataCubit,UserDataStates>(
        listener: (context,state){
          if(state is ForgetPasswordSuccessState){
            customToast(title: 'OTP sent to your email', color: ColorManager.primary);
            navigateTo(context, VerifyEmailScreen(email: emailController.text,));

          }
          if (state is ForgetPasswordErrorState){
            customToast(title: 'Email is invalid', color: ColorManager.red);

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
                title: Text('Forget Password',style: GoogleFonts.inter(
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
                      image: const AssetImage(AssetsManager.lock),
                    ),
                    SizedBox(height: 7.h,),
                    Text('Please enter your email address to \n receive verification code ',style: GoogleFonts.roboto(
                      fontWeight: FontWeight.w600,
                      fontSize: 18.px,
                      color: ColorManager.black,
                    ),
                      textAlign: TextAlign.center,

                    ),
                    const SizedBox(height: 15,),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 25
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText:'E-mail',
                          hintStyle: GoogleFonts.roboto(
                              fontSize: 15.0,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w500
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
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value){
                          if(value!.isEmpty){
                            return 'Please enter your email address';
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
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15
                      ),
                      width: double.infinity,
                      height: 13.h,
                      child: ButtonManager(
                        title: 'Send',
                        function: (){
                           cubit.forgetPassword(email: emailController.text);
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
