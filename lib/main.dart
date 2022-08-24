import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'mobile/business_logic/app_cubit/app_cubit.dart';
import 'mobile/business_logic/home_cubit/home_cubit.dart';
import 'mobile/business_logic/user_data_cubit/user_data_cubit.dart';
import 'mobile/constants/constants.dart';
import 'mobile/data/local/cash_helper.dart';
import 'mobile/data/remote/dio_helper.dart';
import 'mobile/presentation/screens/mobile/home_layout.dart';
import 'mobile/presentation/screens/mobile/splash_screen.dart';
import 'mobile/presentation/screens/mobile/Login_register_screen.dart';
import 'mobile/presentation/styles/theme_manager.dart';



void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CashHelper.init();

  token = CashHelper.getData(key: 'token');

  runApp(const MyApp());
  // blocObserver: MyBlocObserver();

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget ?widget;
    if(token != null)
    {
      widget=const HomeLayout();
    }
    else{
      widget = UserDataScreen();
    }
    return ResponsiveSizer(

      builder: (context, orientation, screenType ) {

        return MultiBlocProvider(
            providers:[
              BlocProvider(
                  create: (context) => UserDataCubit(),
              ),
              BlocProvider(
                  create: (context) => HomeCubit()..getHomeAllData()..getCardData()
              ),
              BlocProvider(
                  create: (context)=> AppCubit()..getBlogs()..getCurrentUser()..getAllForums()..getMyForums(),
              ),
            ],
          child: MaterialApp(
                debugShowCheckedModeBanner: false,
                theme:getApplicationTheme(),
                home: const SplashScreen(),
              )

        );

      }
    );
  }
}

