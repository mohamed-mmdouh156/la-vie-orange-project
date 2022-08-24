import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:la_vie_orange/mobile/constants/constants.dart';
import 'package:la_vie_orange/mobile/data/models/blogs_model.dart';
import 'package:la_vie_orange/mobile/data/models/current_user_model.dart';
import 'package:la_vie_orange/mobile/data/models/forums_model.dart';
import 'package:la_vie_orange/mobile/data/remote/dio_helper.dart';

import '../../constants/end_points.dart';
import 'app_state.dart';


class AppCubit extends Cubit<AppStates>{

  AppCubit() : super(InitialState());

  static AppCubit get(context)=> BlocProvider.of(context);

  List plants=[];
  List seeds=[];
  List tools=[];

  BlogsModel ?blogsModel;

  void getBlogs(){

    emit(GetBlogsLoadingState());
    DioHelper.getData(
        url: GET_BLOGS,
        token:token,
    ).then((value) {

      blogsModel = BlogsModel.fromJson(value.data);

      for (var element in blogsModel!.data!.plants!) {
        plants.add(element);
      }

      for (var element in blogsModel!.data!.seeds!) {
        seeds.add(element);
      }

      for (var element in blogsModel!.data!.tools!) {
        tools.add(element);
      }

      emit(GetBlogsSuccessState());
    }).catchError((error){

      print('Error in getBlogs is ${error.toString()}');
      emit(GetBlogsErrorState());

    });

  }

  CurrentUserModel ?currentUserModel;
  var currentFirstNameController=TextEditingController();
  var currentLastNameController=TextEditingController();
  var currentEmailController=TextEditingController();

  void getCurrentUser(){

    emit(GetCurrentUserLoadingState());
    DioHelper.getData(
        url: GET_CURRENT_USER,
        token:token
    ).then((value) {

      currentUserModel=CurrentUserModel.fromJson(value.data);
      print(value.data);
      currentFirstNameController.text=value.data['data']['firstName'];
      currentLastNameController.text=value.data['data']['lastName'];
      currentEmailController.text=value.data['data']['email'];


      emit(GetCurrentUserSuccessState());
    }).catchError((error){

      print('Error in CurrentUser is ${error.toString()}');
      emit(GetCurrentUserErrorState());

    });
  }

  void updateCurrentUserName(
      String firstName,
      String lastName,
      ){

    emit(UpdateCurrentUserNameLoadingState());
    DioHelper.patchData(
        url: GET_CURRENT_USER,
        token:token,
        data:{
          "firstName": firstName,
          "lastName": lastName,
          "email": currentUserModel!.data!.email,
          "address": currentUserModel!.data!.address
        }
    ).then((value) {

      print(value.data);
      getCurrentUser();
      emit(UpdateCurrentUserNameSuccessState());
    }).catchError((error){

      print('Error in UpdateCurrentUserName is ${error.toString()}');
      emit(UpdateCurrentUserNameErrorState());

    });
  }

  void updateCurrentUserEmail(
      String email,
      ){

    emit(UpdateCurrentUserEmailLoadingState());
    DioHelper.patchData(
        url: GET_CURRENT_USER,
        token:token,
        data:{
          "firstName": currentUserModel!.data!.firstName,
          "lastName": currentUserModel!.data!.lastName,
          "email": email,
          "address": currentUserModel!.data!.address
        }
    ).then((value) {

      print(value.data);
      getCurrentUser();
      emit(UpdateCurrentUserEmailSuccessState());
    }).catchError((error){

      print('Error in UpdateCurrentUserName is ${error.toString()}');
      emit(UpdateCurrentUserEmailErrorState());

    });
  }

  ForumsModel ?forumsModel;

  void getAllForums(
      ){
    emit(GetAllForumsLoadingState());
    DioHelper.getData(
      url: GET_FORUMS,
      token:token,
    ).then((value) {
      print('/////////////////');
      forumsModel = ForumsModel.fromJson(value.data);
      print(forumsModel!.data![0].title);
      print(value.data);
      emit(GetAllForumsSuccessState());
    }).catchError((error){

      print('Error in GetAllForums is ${error.toString()}');
      emit(GetAllForumsErrorState());

    });
  }

  ForumsModel ?userForumsModel;

  void getMyForums(
      ){
    emit(GetMyForumsLoadingState());
    DioHelper.getData(
      url: GET_MY_FORUMS,
      token:token,
    ).then((value) {

      print(value.data);
      userForumsModel=ForumsModel.fromJson(value.data);
      emit(GetMyForumsSuccessState());
    }).catchError((error){

      print('Error in GetAllForums is ${error.toString()}');
      emit(GetMyForumsErrorState());

    });
  }


  ForumsModel ?searchForumModel;

  void getSearchForums(
      {
        String ?postName,
      }
      ){
    emit(GetPostSearchLoadingState());
    DioHelper.getData(
      url: '$GET_FORUMS?search=$postName',
      token:token,
    ).then((value) {

      print(value.data);
      searchForumModel=ForumsModel.fromJson(value.data);
      emit(GetPostSearchSuccessState());
    }).catchError((error){

      print('Error in GetPostSearch is ${error.toString()}');
      emit(GetPostSearchErrorState());

    });
  }

  List <bool> isSelected=[true,false];

  void translateBetweenAllForumsAndMyForumsState(){

    isSelected[0]=!isSelected[0];
    isSelected[1]=!isSelected[1];
    emit(TranslateBetweenAllForumsAndMyForumsState());
  }

  void createPost({
    required String title,
    required String description,
    required File image,

  }){

    emit(CreatePostLoadingState());

    DioHelper.postData(
        url: CREATE_FORUMS,
        data: {
          "title": title,
          "description": description,
          "imageBase64": image
        }
    ).then((value) {

      print(value.data);
      emit(CreatePostSuccessState());

    }).catchError((error){

      print('Error in CreatePost is ${error.toString()}');
      emit(CreatePostErrorState());
    });


  }

  File? uploadedPostImage ;
  var picker = ImagePicker();

  Future <void> getPostImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      uploadedPostImage = File(pickedFile.path);
      emit(GetPostImageSuccessState());
    } else {
      print('No Image selected.');
      emit(GetPostImageErrorState());
    }
  }


}