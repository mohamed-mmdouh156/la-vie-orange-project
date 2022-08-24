import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:la_vie_orange/mobile/business_logic/user_data_cubit/user_data_cubit.dart';
import 'package:la_vie_orange/mobile/business_logic/user_data_cubit/user_data_state.dart';
import 'package:la_vie_orange/mobile/data/local/cash_helper.dart';
import 'package:la_vie_orange/mobile/presentation/screens/mobile/forget_password_screen.dart';
import 'package:la_vie_orange/mobile/presentation/screens/mobile/home_layout.dart';
import 'package:la_vie_orange/mobile/presentation/styles/assets_manager.dart';
import 'package:la_vie_orange/mobile/presentation/styles/color_manager.dart';
import 'package:la_vie_orange/mobile/presentation/widget/defualt_button.dart';
import 'package:la_vie_orange/mobile/presentation/widget/default_form_field.dart';
import 'package:la_vie_orange/mobile/presentation/widget/navigate_replacement.dart';
import 'package:la_vie_orange/mobile/presentation/widget/navigate_to.dart';
import 'package:la_vie_orange/mobile/presentation/widget/toast.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class UserDataScreen extends StatelessWidget {
  UserDataScreen({Key? key}) : super(key: key);

  var emailController = TextEditingController();
  var passController = TextEditingController();
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocConsumer<UserDataCubit, UserDataStates>(
      listener: (context, state) {
        if (state is UserSignUpSuccessState) {
          CashHelper.saveData(key: 'token', value: state.token).then((value) {
            customToast(
                title: 'Register Successfully', color: ColorManager.primary);
            navigateAndReplacement(context, const HomeLayout());
          });
        }

        if (state is UserSignUpErrorState) {
          customToast(
              title: 'Register Failed, Check data and try again',
              color: ColorManager.red);
        }

        if (state is UserSignInErrorState) {
          customToast(
              title: 'Email or password isn\'t correct',
              color: ColorManager.red);
        }

        if (state is UserSignInSuccessState) {
          CashHelper.saveData(key: 'token', value: state.token).then((value) {
            navigateAndReplacement(context, const HomeLayout());

            customToast(
                title: 'Register Successfully', color: ColorManager.primary);
          });
        }
      },
      builder: (context, state) {
        var cubit = UserDataCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 0.0,
          ),
          body: SingleChildScrollView(
            child: Container(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Image(
                          height: 16.h,
                          width: 25.w,
                          image: const AssetImage(AssetsManager.loginImageTop)),
                    ),
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
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          cubit.isLogin
                              ? GestureDetector(
                                  onTap: () {
                                    cubit.switchBetweenLoginAndRegister();
                                  },
                                  child: Text(
                                    'Sign up',
                                    style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18.px,
                                        color: ColorManager.grey),
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () {
                                    cubit.switchBetweenLoginAndRegister();
                                  },
                                  child: Column(
                                    children: [
                                      Text(
                                        'Sign up',
                                        style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 18.px,
                                            color: ColorManager.primary),
                                      ),
                                      Container(
                                        height: 5,
                                        width: 60,
                                        color: ColorManager.primary,
                                      ),
                                    ],
                                  ),
                                ),
                          cubit.isLogin
                              ? GestureDetector(
                                  onTap: () {
                                    cubit.switchBetweenLoginAndRegister();
                                  },
                                  child: Column(
                                    children: [
                                      Text(
                                        'Login',
                                        style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 18.px,
                                            color: ColorManager.primary),
                                      ),
                                      Container(
                                        height: 5,
                                        width: 60,
                                        color: ColorManager.primary,
                                      ),
                                    ],
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () {
                                    cubit.switchBetweenLoginAndRegister();
                                  },
                                  child: Text(
                                    'Login',
                                    style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18.px,
                                        color: ColorManager.grey),
                                  ),
                                ),
                        ],
                      ),
                    ),
                    cubit.isLogin
                        ? Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Email',
                                  style: GoogleFonts.roboto(
                                      color: ColorManager.grey,
                                      fontSize: 14.px,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width: 95.w,
                                  height: 7.h,
                                  child: DefaultFormField(
                                    controller: emailController,
                                    textInputType: TextInputType.emailAddress,
                                    validText: 'Please enter your email',
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Password',
                                  style: GoogleFonts.roboto(
                                      color: ColorManager.grey,
                                      fontSize: 14.px,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width: 95.w,
                                  height: 10.h,
                                  child: DefaultFormField(
                                    controller: passController,
                                    textInputType: TextInputType.visiblePassword,
                                    validText: 'Please enter your password',
                                    isPassword: true,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    navigateTo(context, ForgetPassword());
                                  },
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Text(
                                      'Forget Password',
                                      style: GoogleFonts.roboto(
                                          color: ColorManager.primary,
                                          fontSize: 13.px,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),
                                state is UserSignInLoadingState
                                    ? Padding(
                                        padding: const EdgeInsets.all(17.0),
                                        child: Center(
                                          child: CircularProgressIndicator(
                                            color: ColorManager.primary,
                                          ),
                                        ),
                                      )
                                    : SizedBox(
                                        height: 13.h,
                                        width: 95.w,
                                        child: DefaultButton(
                                            title: 'Login',
                                            function: () {
                                              if (formKey.currentState!
                                                  .validate()) {
                                                cubit.userSignIn(
                                                    email: emailController.text,
                                                    password:
                                                        passController.text);
                                              }
                                            }),
                                      ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 30.w,
                                      height: 1,
                                      color: ColorManager.dartGrey,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'or continue with',
                                      style: GoogleFonts.roboto(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          color: ColorManager.grey),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      width: 30.w,
                                      height: 1,
                                      color: ColorManager.dartGrey,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Image(
                                        image: AssetImage(
                                            AssetsManager.googleImage)),
                                    SizedBox(
                                      width: 9.w,
                                    ),
                                    const Image(
                                        image: AssetImage(
                                            AssetsManager.facebookImage)),
                                  ],
                                ),
                              ],
                            ),
                          )
                        : Container(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'First Name',
                                            style: GoogleFonts.roboto(
                                                color: ColorManager.grey,
                                                fontSize: 14.px,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          SizedBox(
                                            width: 45.w,
                                            height: 7.h,
                                            child: DefaultFormField(
                                              controller: firstNameController,
                                              textInputType: TextInputType.name,
                                              validText:
                                                  'Please enter your firstName',
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Last Name',
                                            style: GoogleFonts.roboto(
                                                color: ColorManager.grey,
                                                fontSize: 14.px,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          SizedBox(
                                            width: 45.w,
                                            height: 7.h,
                                            child: DefaultFormField(
                                              controller: lastNameController,
                                              textInputType: TextInputType.name,
                                              validText:
                                                  'Please enter your lastName',
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    'Email',
                                    style: GoogleFonts.roboto(
                                        color: ColorManager.grey,
                                        fontSize: 14.px,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    width: 95.w,
                                    height: 7.h,
                                    child: DefaultFormField(
                                      controller: emailController,
                                      textInputType: TextInputType.emailAddress,
                                      validText: 'Please enter your email',
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    'Password',
                                    style: GoogleFonts.roboto(
                                        color: ColorManager.grey,
                                        fontSize: 14.px,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    width: 95.w,
                                    height: 7.h,
                                    child: DefaultFormField(
                                      controller: passController,
                                      textInputType:
                                          TextInputType.visiblePassword,
                                      validText: 'please enter your password',
                                      isPassword: true,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    'Confirm Password',
                                    style: GoogleFonts.roboto(
                                        color: ColorManager.grey,
                                        fontSize: 14.px,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    width: 95.w,
                                    height: 7.h,
                                    child: DefaultFormField(
                                      controller: confirmPasswordController,
                                      textInputType:
                                          TextInputType.visiblePassword,
                                      validText: 'passwords doesn\'t equal',
                                      isPassword: true,
                                    ),
                                  ),
                                  state is UserSignUpLoadingState
                                      ? Padding(
                                          padding: const EdgeInsets.all(17.0),
                                          child: Center(
                                            child: CircularProgressIndicator(
                                              color: ColorManager.primary,
                                            ),
                                          ),
                                        )
                                      : SizedBox(
                                          height: 12.h,
                                          width: 95.w,
                                          child: DefaultButton(
                                              title: 'Register',
                                              function: () {
                                                if (formKey.currentState!
                                                    .validate()) {
                                                  cubit.userSignUp(
                                                      firstName:
                                                          firstNameController
                                                              .text,
                                                      lastName:
                                                          lastNameController
                                                              .text,
                                                      email:
                                                          emailController.text,
                                                      password:
                                                          passController.text);
                                                }
                                              }),
                                        ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 30.w,
                                        height: 1,
                                        color: ColorManager.grey,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'or continue with',
                                        style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12,
                                            color: ColorManager.grey),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        width: 30.w,
                                        height: 1,
                                        color: ColorManager.grey,
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Image(
                                          image: AssetImage(
                                              AssetsManager.googleImage)),
                                      SizedBox(
                                        width: 9.w,
                                      ),
                                      const Image(
                                          image: AssetImage(
                                              AssetsManager.facebookImage)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Image(
                          height: 12.h,
                          width: 32.w,
                          image:
                              const AssetImage(AssetsManager.loginImageBottom)),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
