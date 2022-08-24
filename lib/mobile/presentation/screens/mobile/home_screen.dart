import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:la_vie_orange/mobile/business_logic/home_cubit/home_cubit.dart';
import 'package:la_vie_orange/mobile/business_logic/home_cubit/home_state.dart';
import 'package:la_vie_orange/mobile/data/models/home_model.dart';
import 'package:la_vie_orange/mobile/presentation/resources/font_manager.dart';
import 'package:la_vie_orange/mobile/presentation/resources/value_manager.dart';
import 'package:la_vie_orange/mobile/presentation/screens/mobile/cart_screen.dart';
import 'package:la_vie_orange/mobile/presentation/screens/mobile/search_screen.dart';
import 'package:la_vie_orange/mobile/presentation/styles/assets_manager.dart';
import 'package:la_vie_orange/mobile/presentation/styles/color_manager.dart';
import 'package:la_vie_orange/mobile/presentation/widget/button_manager.dart';
import 'package:la_vie_orange/mobile/presentation/widget/navigate_to.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    List tabBarTitles = ['All', 'Plants', 'Seeds', 'Tools'];

    return BlocConsumer<HomeCubit , HomeStates>(
      listener: (context , state){},
      builder: (context , state){

        var cubit = HomeCubit.get(context);

        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30.0,
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
                Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context){
                                return const SearchScreen();
                              },
                          ));
                        },
                        child: Container(
                          height: AppSize.s46,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppSize.s10),
                            color: ColorManager.whiteDark,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppPadding.p20),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.search,
                                  color: ColorManager.grey,
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                Text(
                                  'Search',
                                  style: GoogleFonts.roboto(
                                    fontSize: FontSize.s16,
                                    fontWeight: FontWeight.w400,
                                    color: ColorManager.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Container(
                      height: AppSize.s46,
                      width: AppSize.s51,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSize.s10),
                        color: ColorManager.primary,
                      ),
                      child: IconButton(
                        onPressed: (){
                          navigateTo(context, const CartScreen());
                        },
                        icon: Icon(
                          Icons.shopping_cart_outlined,
                          color: ColorManager.white,
                        ),
                      )
                    ),
                  ],
                ),
                Container(
                  height: 90,
                  color: ColorManager.white,
                  child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: (){
                            cubit.onSelectedTab(index);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: cubit.tabButtonFlags[index] == true ? ColorManager.primary :ColorManager.whiteDark,
                                borderRadius: BorderRadius.circular(AppSize.s12)),
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(vertical: 24),
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                            height: AppSize.s35,
                            child: Text(
                              '${tabBarTitles[index]}',
                              style: GoogleFonts.roboto(
                                  color: cubit.tabButtonFlags[index] == true ? ColorManager.white :ColorManager.grey,
                                  fontSize: FontSize.s16,
                                  fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 10,
                        );
                      },
                      itemCount: tabBarTitles.length),
                ),
                Expanded(
                  child: GridView.count(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    physics: const BouncingScrollPhysics(),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.9,
                    children: List.generate(
                      cubit.homeData.length,
                          (index) => homeListItem(cubit.homeData[index] , context),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget homeListItem(HomeModel model , context) {
    return model.imageUrl == "" ? SizedBox(
      height: 38.h,
      width: 40.w,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Material(
            elevation: 1.5,
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(AppSize.s10),
            shadowColor: ColorManager.lightGrey,
            child: SizedBox(
              height: 35.h,
              width: 44.w,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          child: Container(
                            height: AppSize.s16,
                            width: AppSize.s16,
                            color: ColorManager.whiteDark,
                            child: const Icon(
                              Icons.add,
                              size: AppSize.s8,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text(
                            '1',
                            style: GoogleFonts.roboto(
                              fontSize: FontSize.s16,
                              fontWeight: FontWeight.w500,
                              color: ColorManager.grey,
                            ),
                          ),
                        ),
                        InkWell(
                          child: Container(
                            height: AppSize.s16,
                            width: AppSize.s16,
                            color: ColorManager.whiteDark,
                            child: const Icon(
                              Icons.minimize_sharp,
                              size: AppSize.s8,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      model.name!,
                      style: GoogleFonts.roboto(
                        color: ColorManager.black,
                        fontSize: AppSize.s16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      '70 EGP',
                      style: GoogleFonts.roboto(
                        color: ColorManager.black,
                        fontSize: AppSize.s12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: 40.w,
                      child: ButtonManager(
                        title: 'Add To Card',
                        function: () {
                          HomeCubit.get(context).insertItemToCard(
                              {
                                'name' : model.name!,
                                'description' : model.description!,
                                'imageBase64' : 'magna cillum enim ad',
                                "type": "labore sed elit",
                                "price": "70 EGP",
                                "itemId": model.seedId,
                              }
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Align(
            alignment: AlignmentDirectional.topStart,
            child: Image(
                image: AssetImage(AssetsManager.homeScreenItemImage),
              ),
          ),
        ],
      ),
    ) :
    SizedBox(
      height: 38.h,
      width: 40.w,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Material(
            elevation: 1.5,
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(AppSize.s10),
            shadowColor: ColorManager.lightGrey,
            child: SizedBox(
              height: 35.h,
              width: 44.h,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: AlignmentDirectional.topCenter,
                      child: Stack(
                        children: [
                          Container(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Image(
                              image: NetworkImage('https://lavie.orangedigitalcenteregypt.com${model.imageUrl!}'),
                              height: 11.h,
                              width: 40.w,
                              fit: BoxFit.fill,
                            ),
                          ),
                          // Align(
                          //   alignment: AlignmentDirectional.center,
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.end,
                          //     children: [
                          //       InkWell(
                          //         child: Container(
                          //           height: AppSize.s16,
                          //           width: AppSize.s16,
                          //           color: ColorManager.whiteDark,
                          //           child: const Icon(
                          //             Icons.add,
                          //             size: AppSize.s8,
                          //           ),
                          //         ),
                          //       ),
                          //       Padding(
                          //         padding: const EdgeInsets.all(3.0),
                          //         child: Text(
                          //           '1',
                          //           style: GoogleFonts.roboto(
                          //             fontSize: FontSize.s16,
                          //             fontWeight: FontWeight.w500,
                          //             color: ColorManager.grey,
                          //           ),
                          //         ),
                          //       ),
                          //       InkWell(
                          //         child: Container(
                          //           height: AppSize.s16,
                          //           width: AppSize.s16,
                          //           color: ColorManager.whiteDark,
                          //           child: const Icon(
                          //             Icons.minimize_sharp,
                          //             size: AppSize.s8,
                          //           ),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      model.name!,
                      style: GoogleFonts.roboto(
                        color: ColorManager.black,
                        fontSize: 16.px,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      '70 EGP',
                      style: GoogleFonts.roboto(
                        color: ColorManager.black,
                        fontSize: 12.px,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: 40.w,
                      child: ButtonManager(
                        title: 'Add To Card',
                        function: () {
                          HomeCubit.get(context).insertItemToCard(
                            {
                              'name' : model.name!,
                              'description' : model.description!,
                              'imageBase64' : 'magna cillum enim ad',
                              "type": "labore sed elit",
                              "price": "70 EGP",
                              "itemId": model.seedId,
                            }
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

}
