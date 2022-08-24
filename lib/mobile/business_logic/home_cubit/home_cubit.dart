import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_orange/mobile/business_logic/home_cubit/home_state.dart';
import 'package:la_vie_orange/mobile/constants/constants.dart';
import 'package:la_vie_orange/mobile/constants/end_points.dart';
import 'package:la_vie_orange/mobile/data/models/card_model.dart';
import 'package:la_vie_orange/mobile/data/models/home_model.dart';
import 'package:la_vie_orange/mobile/data/remote/dio_helper.dart';
import 'package:la_vie_orange/mobile/presentation/screens/mobile/home_screen.dart';
import 'package:la_vie_orange/mobile/presentation/screens/mobile/notification_screen.dart';
import 'package:la_vie_orange/mobile/presentation/screens/mobile/posts_screen.dart';
import 'package:la_vie_orange/mobile/presentation/screens/mobile/profile_screen.dart';
import 'package:la_vie_orange/mobile/presentation/screens/mobile/qr_scan_screen.dart';

class HomeCubit extends Cubit<HomeStates>{

  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context)=> BlocProvider.of(context);


  List<HomeModel> homeData = [];

  List<Widget> homeScreens = [
    PostsScreen(),
    const QrScanScreen(),
    const HomeScreen(),
    const NotificationScreen(),
    const ProfileScreen(),
  ];

  int currentIndex = 2;

  void changeNavigationBar(int index){
    currentIndex = index;
    emit(ChangeNavigationBarState());
  }

  List <bool> tabButtonFlags = [
    true,
    false,
    false,
    false,
  ];

  void onSelectedTab (index)
  {
    switch(index)
    {
      case 0 : {
        tabButtonFlags = [
          true,
          false,
          false,
          false,
        ];
        getHomeAllData();
        break;
      }
      case 1 : {
        tabButtonFlags = [
          false,
          true,
          false,
          false,
        ];
        getHomePlants();
        break;
      }
      case 2 : {
        tabButtonFlags = [
          false,
          false,
          true,
          false,
        ];
        getHomeSeeds();
        break;
      }
      case 3 : {
        tabButtonFlags = [
          false,
          false,
          false,
          true,
        ];
        getHomeTools();
        break;
      }
    }

    emit(ChangeHomeTabFlagsState());
  }





  void getHomeSeeds (){
    homeData = [];
    DioHelper.getData(
      url: SEEDS_END_POINT,
        token: token,

    ).then((value) {

      for(Map<String, dynamic> seeds in value.data['data']){
        homeData.add(HomeModel.fromJson(seeds));
      }
      print('Home Seeds : $homeData');
      emit(GetHomeSeedsSuccessState());
    }).catchError((error){
      print('Error when get home Seeds : ${error.toString()}');
      emit(GetHomeSeedsErrorState());
    });
  }


  void getHomeTools (){
    homeData = [];

    DioHelper.getData(
      url: TOOLS_END_POINT,
        token: token

    ).then((value) {

      for(Map<String, dynamic> seeds in value.data['data']){
        homeData.add(HomeModel.fromJson(seeds));
      }
      print('Home Tools : $homeData');
      emit(GetHomePlantsSuccessState());
    }).catchError((error){
      print('Error when get home Tools : ${error.toString()}');
      emit(GetHomePlantsErrorState());
    });
  }


  void getHomePlants (){
    homeData = [];

    DioHelper.getData(
      url: PLANTS_END_POINT,
        token: token

    ).then((value) {

      for(Map<String, dynamic> seeds in value.data['data']){
        homeData.add(HomeModel.fromJson(seeds));
      }
      print('Home Plants : $homeData');
      emit(GetHomeToolsSuccessState());
    }).catchError((error){
      print('Error when get home Plants : ${error.toString()}');
      emit(GetHomeToolsErrorState());
    });
  }


  void getHomeAllData (){
    homeData = [];

    DioHelper.getData(
      url: SEEDS_END_POINT,
      token: token

    ).then((value) {

      for(Map<String, dynamic> seeds in value.data['data']){
        homeData.add(HomeModel.fromJson(seeds));
      }
      print('Home Seeds : $homeData');
      emit(GetHomeSeedsSuccessState());
    }).catchError((error){
      print('Error when get home Seeds : ${error.toString()}');
      emit(GetHomeSeedsErrorState());
    });

    DioHelper.getData(
      url: PLANTS_END_POINT,
      token: token
    ).then((value) {
      for(Map<String, dynamic> seeds in value.data['data']){
        homeData.add(HomeModel.fromJson(seeds));
      }
      print('Home Plants : $homeData');
      emit(GetHomeToolsSuccessState());
    }).catchError((error){
      print('Error when get home Plants : ${error.toString()}');
      emit(GetHomeToolsErrorState());
    });

    DioHelper.getData(
      url: TOOLS_END_POINT,
      token: token
    ).then((value) {

      for(Map<String, dynamic> seeds in value.data['data']){
        homeData.add(HomeModel.fromJson(seeds));
      }
      print('Home Tools : $homeData');
      emit(GetHomePlantsSuccessState());
    }).catchError((error){
      print('Error when get home Tools : ${error.toString()}');
      emit(GetHomePlantsErrorState());
    });

  }


  void insertItemToCard (Map<String , dynamic>  data){
    DioHelper.postData(
      url: INSERT_ITEM_END_POINT,
      data: data,
      token: token
    ).then((value) {
      print("Insert Item Success : ${value.data}");
      emit(InsertItemSuccessState());
    }).catchError((error){
      print('error when insert item to card : $error');
      emit(InsertItemErrorState());
    });
  }

  CardModel? cardModel;
  List <CardModel>  myCardData = [];

  void getCardData (){
    DioHelper.getData(
      url: 'products',
      token: token

    ).then((value){
      print('Card Data : ${value.data['data']}');
      for(Map<String , dynamic> cardItem in value.data['data'])
        {
          myCardData.add(CardModel.fromJson(cardItem));
        }
      emit(GetCardDataSuccessState());
    }).catchError((error){
      print('Error when get Card data : ${error.toString()}');
      emit(GetCardDataErrorState());
    });
  }


  List<HomeModel> searchData = [];

  void searchFunction (String searchInput)
  {
    searchData = [];
    for (HomeModel search in homeData)
      {
        if(search.name!.startsWith(searchInput))
        {
          searchData.add(search);
        }
      }

    print('Search data : ${searchData.toString()}');
    emit(HomeSearchState());
  }





}