import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_orange/mobile/presentation/screens/mobile/add_post.dart';
import 'package:la_vie_orange/mobile/presentation/screens/mobile/blogs_details_screen.dart';
import 'package:la_vie_orange/mobile/presentation/screens/mobile/blogs_screen.dart';
import 'package:la_vie_orange/mobile/presentation/screens/mobile/cart_screen.dart';
import 'package:la_vie_orange/mobile/presentation/screens/mobile/cart_search_screen.dart';
import 'package:la_vie_orange/mobile/presentation/screens/mobile/qr_reader_screen.dart';
import 'package:la_vie_orange/mobile/presentation/screens/mobile/questions_screen.dart';
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

  // token = CashHelper.getData(key: 'token');
  token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI4OTFjMjZlYS1kNTNhLTRkMjUtOThlMy1lMTgwNGQwZTk0ZTgiLCJpYXQiOjE2NjEzNjgwNDcsImV4cCI6MTY2MTU0MDg0N30.xm7AuJwZOf6NeHwS8WT3qvbaJj0FXtHwWA8mUtUj0pM";

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

