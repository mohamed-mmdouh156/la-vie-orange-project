import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_orange/mobile/business_logic/home_cubit/home_cubit.dart';
import 'package:la_vie_orange/mobile/business_logic/home_cubit/home_state.dart';
import 'package:la_vie_orange/mobile/presentation/styles/color_manager.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int page = 0;

    GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();

    return BlocConsumer<HomeCubit , HomeStates>(
      listener: (context , state){},
      builder: (context , state){

        var cubit = HomeCubit.get(context);

        return Scaffold(
          body: cubit.homeScreens[cubit.currentIndex],
          bottomNavigationBar: CurvedNavigationBar(
            key: bottomNavigationKey,
            index: cubit.currentIndex,
            height: 60.0,
            items: [
              const Icon(
                Icons.nature_outlined,
                size: 24,
              ),
              const Icon(
                Icons.qr_code,
                size: 24,
              ),
              Icon(
                Icons.home,
                size: 24,
                color: ColorManager.white,
              ),
              const Icon(
                Icons.notifications_none,
                size: 24,
              ),
              const Icon(
                Icons.perm_identity,
                size: 24,
              ),
            ],
            color: ColorManager.whiteDark,
            buttonBackgroundColor: ColorManager.primary,
            backgroundColor: ColorManager.white,
            animationCurve: Curves.easeInOut,
            animationDuration: const Duration(
              milliseconds: 600,
            ),
            onTap: (index) {
              cubit.changeNavigationBar(index);
            },
            letIndexChange: (index) => true,
          ),
        );
      },
    );
  }
}
