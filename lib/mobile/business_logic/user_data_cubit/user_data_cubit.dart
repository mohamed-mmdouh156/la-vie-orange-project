import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_orange/mobile/business_logic/user_data_cubit/user_data_state.dart';
import 'package:la_vie_orange/mobile/constants/end_points.dart';
import 'package:la_vie_orange/mobile/data/models/user_model.dart';
import 'package:la_vie_orange/mobile/data/remote/dio_helper.dart';

class UserDataCubit extends Cubit<UserDataStates>{

  UserDataCubit() : super(InitialState());

  static UserDataCubit get(context)=> BlocProvider.of(context);



  bool isLogin=true;

  void switchBetweenLoginAndRegister(){

    isLogin=!isLogin;
    emit(SwitchBetweenLoginAndRegister());

  }

  void userSignUp({

      required String firstName,
      required String lastName,
      required String email,
      required String password,

  }){

    emit(UserSignUpLoadingState());
    DioHelper.postData(
        url: USER_SIGN_UP,
        data: {
          "firstName": firstName,
          "lastName": lastName,
          "email": email,
          "password": password
        }
    ).then((value) {
      print('//////////////////////////');
      print(value.data);

      userModel=UserModel.fromJson(value.data);


      emit(UserSignUpSuccessState(userModel!.data!.accessToken));
    }).catchError((error){

      print('Error in SignUp is ${error.toString()}');
      emit(UserSignUpErrorState());

    });

  }

  UserModel ?userModel;
  void userSignIn({

    required String email,
    required String password,

  }){

    emit(UserSignInLoadingState());
    DioHelper.postData(
        url: USER_SIGN_IN,
        data: {
          "email": email,
          "password": password
        }
    ).then((value) {
      print('//////////////////////////');
      print(value.data);
      userModel=UserModel.fromJson(value.data);
      print('${userModel!.data!.accessToken}');

      emit(UserSignInSuccessState(userModel!.data!.accessToken));
    }).catchError((error){

      print('Error in SignIn is ${error.toString()}');
      emit(UserSignInErrorState());

    });

  }

  void forgetPassword({

    required String email,

  }){

    emit(ForgetPasswordLoadingState());
    DioHelper.postData(
        url: FORGET_PASSWORD,
        data: {
          "email": email,
        }
    ).then((value) {

      print(value.data['message']);
      emit(ForgetPasswordSuccessState());
    }).catchError((error){

      print('Error in ForgetPassword is ${error.toString()}');
      emit(ForgetPasswordErrorState());

    });

  }

  void verifiyOtp({

    required String email,
    required String otpCode,

  }){

    emit(VerifiyOTPLoadingState());
    DioHelper.postData(
        url: VERIFIY_OTP,
        data: {
          "email": email,
          "otp":otpCode
        }
    ).then((value) {

      print(value.data['message']);
      emit(VerifiyOTPSuccessState());
    }).catchError((error){

      print('Error in VerifiyOTP is ${error.toString()}');
      emit(VerifiyOTPErrorState());

    });

  }


  void resetPassword({

    required String email,
    required String otpCode,
    required String password,


  }){

    emit(ResetPasswordLoadingState());
    DioHelper.postData(
        url: RESET_PASSWORD,
        data: {
          "email": email,
          "otp":otpCode,
          "password":password
        }
    ).then((value) {

      print(value.data['message']);
      print(value.data);
      emit(ResetPasswordSuccessState());
    }).catchError((error){

      print('Error in ResetPassword is ${error.toString()}');
      emit(ResetPasswordErrorState());

    });

  }
  
  
  
  }
  