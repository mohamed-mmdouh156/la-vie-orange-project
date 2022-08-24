import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:la_vie_orange/mobile/business_logic/home_cubit/home_cubit.dart';
import 'package:la_vie_orange/mobile/business_logic/home_cubit/home_state.dart';
import 'package:la_vie_orange/mobile/data/models/home_model.dart';
import 'package:la_vie_orange/mobile/presentation/resources/font_manager.dart';
import 'package:la_vie_orange/mobile/presentation/resources/value_manager.dart';
import 'package:la_vie_orange/mobile/presentation/styles/assets_manager.dart';
import 'package:la_vie_orange/mobile/presentation/styles/color_manager.dart';
import 'package:la_vie_orange/mobile/presentation/widget/button_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();

    return BlocConsumer<HomeCubit , HomeStates>(
      listener: (context , state) {},
      builder: (context , state) {

        var cubit = HomeCubit.get(context);

        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: AppPadding.p12 , horizontal: AppPadding.p20),
            child: Column(
              crossAxisAlignment : CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: ColorManager.whiteDark,
                    borderRadius: BorderRadius.circular(AppSize.s12),
                  ),
                  child: TextFormField(
                    style: TextStyle(
                      fontSize: AppSize.s16,
                      fontWeight: FontWeight.w400,
                      color: ColorManager.grey,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: GoogleFonts.roboto(
                        fontSize: 16.px,
                        fontWeight: FontWeight.w400,
                        color: ColorManager.grey,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: AppSize.s18,
                        horizontal: AppSize.s12,
                      ),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      fillColor: Colors.blue,
                      prefixIcon: Icon(
                        Icons.search,
                        color: ColorManager.grey,
                      ),
                    ),
                    onChanged: (searchInput){
                      cubit.searchFunction(searchInput);
                    },
                    controller: searchController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'this field must not be Empty';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(
                  height: AppSize.s22,
                ),
                cubit.searchData.isNotEmpty ? Expanded(
                  child: GridView.count(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    physics: const BouncingScrollPhysics(),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.8,
                    children: List.generate(
                      cubit.searchData.length,
                          (index) => homeListItem(cubit.searchData[index] , context),
                    ),
                  ),
                ): Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: AppPadding.p22),
                        child: Text(
                          'Recent Search',
                          style: GoogleFonts.roboto(
                            fontSize: AppSize.s14,
                            fontWeight: FontWeight.w400,
                            color: ColorManager.grey,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: AppPadding.p22),
                          child: ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context , index) => searchItem(),
                            separatorBuilder: (context , index) => const SizedBox(
                              height: AppSize.s2,
                            ),
                            itemCount: 6,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget searchItem ()
  {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p18),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          children: [
            Icon(
              Icons.access_time_outlined,
              color: ColorManager.grey,
              size: AppSize.s18,
            ),
            const SizedBox(
              width: AppSize.s10,
            ),
            Expanded(
              child: Text(
                'gardenia plant',
                style: GoogleFonts.roboto(
                  fontSize: AppSize.s16,
                  fontWeight: FontWeight.w400,
                  color: ColorManager.grey,
                ),
              ),
            ),
            Icon(
              Icons.close,
              color: ColorManager.grey,
              size: AppSize.s18,
            ),
          ],
        ),
      ),
    );
  }

  Widget homeListItem(HomeModel model , context) {
    return model.imageUrl == "" ? SizedBox(
      height: 270.0,
      width: 180,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Material(
            elevation: 1.5,
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(AppSize.s10),
            shadowColor: ColorManager.lightGrey,
            child: SizedBox(
              height: AppSize.s227,
              width: AppSize.s176,
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
                    ButtonManager(
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
      height: 280.0,
      width: 180,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Material(
            elevation: 1.5,
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(AppSize.s10),
            shadowColor: ColorManager.lightGrey,
            child: SizedBox(
              height: 280,
              width: AppSize.s176,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: AlignmentDirectional.topCenter,
                      child: Stack(
                        children: [
                          Image(
                            image: NetworkImage('https://lavie.orangedigitalcenteregypt.com${model.imageUrl!}'),
                            height: 110,
                            width: AppSize.s176,
                            fit: BoxFit.cover,
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
                    ButtonManager(
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
