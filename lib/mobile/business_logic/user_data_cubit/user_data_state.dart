abstract class UserDataStates{}

class InitialState extends UserDataStates{}

class SwitchBetweenLoginAndRegister extends UserDataStates{}


class UserSignUpLoadingState extends UserDataStates{}
class UserSignUpSuccessState extends UserDataStates{
  String ?token;

  UserSignUpSuccessState(this.token);
}
class UserSignUpErrorState extends UserDataStates{}

class UserSignInLoadingState extends UserDataStates{}
class UserSignInSuccessState extends UserDataStates{
  String ?token;

  UserSignInSuccessState(this.token);

}
class UserSignInErrorState extends UserDataStates{}

class ForgetPasswordLoadingState extends UserDataStates{}
class ForgetPasswordSuccessState extends UserDataStates{}
class ForgetPasswordErrorState extends UserDataStates{}

class VerifiyOTPLoadingState extends UserDataStates{}
class VerifiyOTPSuccessState extends UserDataStates{}
class VerifiyOTPErrorState extends UserDataStates{}

class ResetPasswordLoadingState extends UserDataStates{}
class ResetPasswordSuccessState extends UserDataStates{}
class ResetPasswordErrorState extends UserDataStates{}
