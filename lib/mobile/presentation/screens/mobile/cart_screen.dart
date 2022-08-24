import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:la_vie_orange/mobile/business_logic/home_cubit/home_cubit.dart';
import 'package:la_vie_orange/mobile/business_logic/home_cubit/home_state.dart';
import 'package:la_vie_orange/mobile/data/models/card_model.dart';
import 'package:la_vie_orange/mobile/presentation/styles/assets_manager.dart';
import 'package:la_vie_orange/mobile/presentation/styles/color_manager.dart';
import 'package:la_vie_orange/mobile/presentation/widget/defualt_button.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer <HomeCubit , HomeStates> (
      listener: (context , state) {},
      builder: (context , state) {

        var cubit = HomeCubit.get(context);
        List cardsData = cubit.myCardData;

        return Scaffold(
          backgroundColor: ColorManager.whiteDark,
          appBar: AppBar(
            leading: IconButton(
              onPressed: (){},
              icon: const Icon(
                  Icons.arrow_back_outlined
              ),
              color: ColorManager.black,
            ),
            title: Text(
              'My Cart',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 20.px,
                color: ColorManager.black,
              ),
            ),
            centerTitle: true,
          ),
          body: cardsData.isNotEmpty ? Column(
            children: [
              Container(
                color: ColorManager.whiteDark,
                height: 70.h,
                width: double.infinity,
                child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context , index){
                      return cardItem(cardsData[index]);
                    },
                    separatorBuilder: (context , index){
                      return const SizedBox(
                        height: 0,
                      );
                    },
                    itemCount: cardsData.length,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 22
                ),
                child: Row(
                  children: [
                    Text(
                      'Total',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontSize: 20.px,
                        color: ColorManager.black,
                      ),
                    ),
                    const Spacer(),
                    Text('180.000',style: GoogleFonts.inter(
                      fontWeight: FontWeight.w800,
                      fontSize: 16.25.px,
                      color: ColorManager.primary,
                    ),),
                    const SizedBox(width: 2,),
                    Text(
                      'Egp',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w600,
                        fontSize: 21.44.px,
                        color: ColorManager.primary,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: DefaultButton(
                    title: 'Checkout',
                    function: (){},
                  ),
                ),
              ),
            ],
          ) : Container(
            child: Column(
              children: [
                SizedBox(height: 15.h,),
                Image(
                    height: 35.h,
                    width: 80.w,
                    image: const AssetImage(AssetsManager.cartEmpty)
                ),
                const SizedBox(height: 15,),
                Text('Your cart is empty',style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w700,
                  fontSize: 24.px,
                  color: ColorManager.black,
                ),),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12
                  ),
                  child: Text('Sorry, the keyword you entered cannot be \n found, please check again o r search with \n another keyword',style: GoogleFonts.roboto(
                    fontWeight: FontWeight.w400,
                    fontSize: 18.px,
                    color: ColorManager.dartGrey,
                  ),
                    textAlign: TextAlign.center,
                  ),
                ),

              ],
            ),
          ),
        );
      },
    );
  }



  Widget cardItem (CardModel model)
  {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: ColorManager.white,
              borderRadius: BorderRadius.circular(15)
          ),
          child: Material(
            elevation: 2,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
            ),
            child: Row(
              children: [
                const SizedBox(width: 10,),
                model.imageUrl == '' ? Image(
                  image: const AssetImage(AssetsManager.imageTest),
                  height: 20.h,
                  width: 33.w,
                ) : Image(
                  image: NetworkImage("https://lavie.orangedigitalcenteregypt.com${model.imageUrl}"),
                  height: 20.h,
                  width: 33.w,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      model.name.toString(),
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w600,
                        fontSize: 18.px,
                        color: ColorManager.black,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      model.price.toString(),
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w500,
                        fontSize: 15.23.px,
                        color: ColorManager.primary,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                child: Container(
                                  height: 5.h,
                                  width: 10.w,
                                  color: ColorManager.whiteDark,
                                  child: const Icon(
                                    Icons.add,
                                    size: 16,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Text(
                                  '1',
                                  style: GoogleFonts.roboto(
                                    fontSize: 16.px,
                                    fontWeight: FontWeight.w500,
                                    color: ColorManager.grey,
                                  ),
                                ),
                              ),
                              InkWell(
                                child: Container(
                                  height: 5.h,
                                  width: 10.w,
                                  color: ColorManager.whiteDark,
                                  child: const Icon(
                                    Icons.minimize_outlined,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        SizedBox(
                          width: 20.w,
                        ),
                        IconButton(
                            onPressed:(){},
                            icon: Icon(
                              Icons.delete,
                              color: ColorManager.primary,
                            ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }


}
