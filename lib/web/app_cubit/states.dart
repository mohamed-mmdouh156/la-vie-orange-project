abstract class WebStates {}

class WebStatesInitialState extends WebStates {}

class WebStatesLoadingState extends WebStates {}

class WebStatesSuccessState extends WebStates {}

class WebStatesErrorState extends WebStates {
  String error;

  WebStatesErrorState({required this.error});
}

class ShowAnswerState extends WebStates {}

class CheckTrueState extends WebStates {}

class GetPlantsLoadingState extends WebStates {}

class GetPlantsSuccessState extends WebStates {}

class GetPlantsErrorState extends WebStates {
  String error;

  GetPlantsErrorState({required this.error});
}

class GetToolsLoadingState extends WebStates {}

class GetToolsSuccessState extends WebStates {}

class GetToolsErrorState extends WebStates {
  String? error;

  GetToolsErrorState({this.error});
}

class GetSeedsLoadingState extends WebStates {}

class GetSeedsSuccessState extends WebStates {}

class GetSeedsErrorState extends WebStates {
  String? error;

  GetSeedsErrorState({this.error});
}

class GetPlantDetailsLoadingState extends WebStates {}

class GetPlantDetailsSuccessState extends WebStates {}

class GetPlantDetailsErrorState extends WebStates {
  String? error;

  GetPlantDetailsErrorState({this.error});
}

class GetBlogsLoadingState extends WebStates {}

class GetBlogsSuccessState extends WebStates {}

class GetBlogsErrorState extends WebStates {
  String? error;

  GetBlogsErrorState({this.error});
}

class GetAllForumsLoadingState extends WebStates {}

class GetAllForumsSuccessState extends WebStates {}

class GetAllForumsErrorState extends WebStates {
  String? error;

  GetAllForumsErrorState({this.error});
}

class GetMyForumsLoadingState extends WebStates {}

class GetMyForumsSuccessState extends WebStates {}

class GetMyForumsErrorState extends WebStates {
  String? error;

  GetMyForumsErrorState({this.error});
}

class CreatePostLoadingState extends WebStates {}

class CreatePostSuccessState extends WebStates {}

class CreatePostErrorState extends WebStates {
  String? error;

  CreatePostErrorState({this.error});
}

class AddAddressLoadingState extends WebStates {}

class AddAddressSuccessState extends WebStates {}

class AddAddressErrorState extends WebStates {
  String? error;

  AddAddressErrorState({this.error});
}

class GetCurrentUserLoadingState extends WebStates {}

class GetCurrentUserSuccessState extends WebStates {}

class GetCurrentUserErrorState extends WebStates {
  String? error;

  GetCurrentUserErrorState({this.error});
}

class UpdateCurrentUserLoadingState extends WebStates {}

class UpdateCurrentUserSuccessState extends WebStates {}

class UpdateCurrentUserErrorState extends WebStates {
  String? error;

  UpdateCurrentUserErrorState({this.error});
}

class ChangeForumsState extends WebStates {}

class ChangeInfoState extends WebStates {}

class InsertItemSuccessState extends WebStates {}

class InsertItemErrorState extends WebStates {
  String? error;

  InsertItemErrorState({this.error});
}

class GetPostImageSuccessState extends WebStates {}

class GetPostImageErrorState extends WebStates {
  String? error;

  GetPostImageErrorState({this.error});
}

class IncreaseQualityState extends WebStates {}

class DecreaseQualityState extends WebStates {}
