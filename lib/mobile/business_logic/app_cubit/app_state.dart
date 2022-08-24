abstract class AppStates{}

class InitialState extends AppStates{}

class GetBlogsLoadingState extends AppStates{}
class GetBlogsSuccessState extends AppStates{}
class GetBlogsErrorState extends AppStates{}

class GetCurrentUserLoadingState extends AppStates{}
class GetCurrentUserSuccessState extends AppStates{}
class GetCurrentUserErrorState extends AppStates{}

class UpdateCurrentUserNameLoadingState extends AppStates{}
class UpdateCurrentUserNameSuccessState extends AppStates{}
class UpdateCurrentUserNameErrorState extends AppStates{}

class UpdateCurrentUserEmailLoadingState extends AppStates{}
class UpdateCurrentUserEmailSuccessState extends AppStates{}
class UpdateCurrentUserEmailErrorState extends AppStates{}

class GetAllForumsLoadingState extends AppStates{}
class GetAllForumsSuccessState extends AppStates{}
class GetAllForumsErrorState extends AppStates{}

class GetMyForumsLoadingState extends AppStates{}
class GetMyForumsSuccessState extends AppStates{}
class GetMyForumsErrorState extends AppStates{}

class GetPostSearchLoadingState extends AppStates{}
class GetPostSearchSuccessState extends AppStates{}
class GetPostSearchErrorState extends AppStates{}

class TranslateBetweenAllForumsAndMyForumsState extends AppStates{}

class CreatePostLoadingState extends AppStates{}
class CreatePostSuccessState extends AppStates{}
class CreatePostErrorState extends AppStates{}

class GetPostImageSuccessState extends AppStates{}
class GetPostImageErrorState extends AppStates{}