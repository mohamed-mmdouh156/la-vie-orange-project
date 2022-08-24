import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:la_vie_orange/mobile/business_logic/app_cubit/app_cubit.dart';
import 'package:la_vie_orange/mobile/business_logic/app_cubit/app_state.dart';
import 'package:la_vie_orange/mobile/presentation/resources/value_manager.dart';
import 'package:la_vie_orange/mobile/presentation/screens/mobile/add_post.dart';
import 'package:la_vie_orange/mobile/presentation/styles/assets_manager.dart';
import 'package:la_vie_orange/mobile/presentation/styles/color_manager.dart';
import 'package:la_vie_orange/mobile/presentation/widget/defualt_button.dart';
import 'package:la_vie_orange/mobile/presentation/widget/navigate_to.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PostsScreen extends StatelessWidget {
  PostsScreen({Key? key}) : super(key: key);


  var searchController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener:(context,state){

      },
      builder:(context,state){
        var cubit=AppCubit.get(context);
        return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: ColorManager.black,
                ),

                onPressed: (){

                },
              ),
              centerTitle: true,
              title: Text('Discussion Forums',style: GoogleFonts.roboto(
                  fontSize: 21.px,
                  fontWeight: FontWeight.w700,
                  color: ColorManager.black
              ),),
            ),
            body:  SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: 15
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
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
                                  Container(
                                    padding: const EdgeInsets.only(top: 12),
                                    height: 30.h,
                                    width: 70.w,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        hintText:'Search',
                                        hintStyle: GoogleFonts.roboto(
                                          fontSize: 15.0,
                                          color: Colors.grey[600],
                                          fontWeight: FontWeight.w500,
                                        ),
                                        // filled: true,
                                        // fillColor: ColorManager.whiteDark,
                                        border: const OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                        ),

                                      ),
                                      style: GoogleFonts.roboto(
                                        color: Colors.black,
                                        fontSize: 15,
                                      ),
                                      controller: searchController,
                                      keyboardType: TextInputType.visiblePassword,
                                      validator: (value){
                                        if(value!.isEmpty){
                                          return 'Please enter post name';
                                        }
                                        else
                                        {
                                          return null;
                                        }
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
                    Row(
                      children: [
                        SizedBox(
                          width: 38.w,
                          height: 11.5.h,
                          child: cubit.isSelected[0]? DefaultButton(
                            title: 'All forums',
                            function: (){
                              cubit.translateBetweenAllForumsAndMyForumsState();
                            },
                            size: 12.px,
                          )
                              :Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: .5.w,
                                vertical: 2.8.h
                            ),
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: ColorManager.grey,
                                      width: 1
                                  ),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              padding: const EdgeInsets.symmetric(
                                vertical: 14,
                              ),
                              color: ColorManager.white,
                              onPressed: (){
                                cubit.translateBetweenAllForumsAndMyForumsState();
                              },
                              child: Text('All forums',style: GoogleFonts.roboto(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: ColorManager.grey
                              ),),
                            ),
                          ),
                        ),
                        const SizedBox(width: 5,),
                        SizedBox(
                          width: 38.w,
                          height: 11.5.h,
                          child: cubit.isSelected[1]? DefaultButton(
                            title: 'My forums',
                            function: (){
                              cubit.translateBetweenAllForumsAndMyForumsState();

                            },
                            size: 12.px,
                          ):Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: .5.w,
                                vertical: 2.8.h
                            ),
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: ColorManager.grey,
                                      width: 1
                                  ),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              padding: const EdgeInsets.symmetric(
                                vertical: 14,
                              ),
                              color: ColorManager.white,
                              onPressed: (){
                                cubit.translateBetweenAllForumsAndMyForumsState();

                              },
                              child: Text('My forums',style: GoogleFonts.roboto(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: ColorManager.grey
                              ),),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    cubit.isSelected[0]?
                    cubit.forumsModel !=null?
                    ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context,index){
                          return Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2,
                                        color: ColorManager.black.withOpacity(.10)
                                    )
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children:  [

                                          const CircleAvatar(
                                            backgroundImage: NetworkImage('https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?w=740&t=st=1660819991~exp=1660820591~hmac=843f85b576828bed5e4619f62d5f54bbfa768bd8827f80cbe0ae0510961f647d'),
                                            radius: 25,
                                          ),
                                          const SizedBox(width: 10,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('Mahmoud Reda',style: GoogleFonts.roboto(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 13.px,
                                                color: ColorManager.black,
                                              ),),
                                              const SizedBox(height: 5,),
                                              Text('a month ago',style: GoogleFonts.roboto(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 11.px,
                                                color: const Color(0xff8F8D8D),
                                              ),),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 5,),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('${cubit.forumsModel!.data![index].title}',style: GoogleFonts.roboto(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          color: ColorManager.primary
                                      ),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('${cubit.forumsModel!.data![index].description}',style: GoogleFonts.roboto(
                                          fontSize: 11.px,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xff8F8D8D)
                                      ),),
                                    ),
                                    const SizedBox(height: 10,),
                                    cubit.forumsModel!.data![index].imageUrl==""?
                                    Image(
                                      image: const NetworkImage(
                                          'https://img.freepik.com/free-photo/closeup-hairy-desert-rose-succulent_53876-145028.jpg?w=740&t=st=1660819793~exp=1660820393~hmac=2ce89de317163866d4c27dd25426460d42c0eb4ffabd9954e7c4d627097769a1'

                                      ),
                                      height: 20.h,
                                      width: 33.w,
                                    ):
                                    Image(
                                      image: NetworkImage('https://lavie.orangedigitalcenteregypt.com${cubit.forumsModel!.data![index].imageUrl}'),
                                      height: 25.h,
                                      width: double.infinity,
                                      fit: BoxFit.fill,
                                    ),


                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  const Image(
                                    image: AssetImage(AssetsManager.like),
                                    height: 50,
                                    width: 30,
                                  ),
                                  Text('0',style: GoogleFonts.roboto(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                      color: ColorManager.grey
                                  ),),
                                  const SizedBox(width: 5,),
                                  Text('Likes',style: GoogleFonts.roboto(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                      color: ColorManager.grey
                                  ),),
                                  SizedBox(width: 17.w,),
                                  Text('2',style: GoogleFonts.roboto(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                      color: ColorManager.grey
                                  ),),
                                  const SizedBox(width: 5,),
                                  Text('Replies',style: GoogleFonts.roboto(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                      color: ColorManager.grey
                                  ),),
                                ],
                              )
                            ],
                          );

                        },
                        separatorBuilder: (context,index){
                          return const SizedBox(height: 10,);
                        },
                        itemCount: cubit.forumsModel!.data!.length
                    ):
                    Center(
                      child:CircularProgressIndicator(
                        color: ColorManager.primary,
                      ),
                    )
                        :cubit.userForumsModel !=null?
                    ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context,index){
                          return Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2,
                                        color: ColorManager.black.withOpacity(.10)
                                    )
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children:  [

                                          const CircleAvatar(
                                            backgroundImage: NetworkImage('https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?w=740&t=st=1660819991~exp=1660820591~hmac=843f85b576828bed5e4619f62d5f54bbfa768bd8827f80cbe0ae0510961f647d'),
                                            radius: 25,
                                          ),
                                          const SizedBox(width: 10,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('Mahmoud Reda',style: GoogleFonts.roboto(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 13.px,
                                                color: ColorManager.black,
                                              ),),
                                              const SizedBox(height: 5,),
                                              Text('a month ago',style: GoogleFonts.roboto(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 11.px,
                                                color: const Color(0xff8F8D8D),
                                              ),),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 5,),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('${cubit.userForumsModel!.data![index].title}',style: GoogleFonts.roboto(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          color: ColorManager.primary
                                      ),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('${cubit.userForumsModel!.data![index].description}',style: GoogleFonts.roboto(
                                          fontSize: 11.px,
                                          fontWeight: FontWeight.w400,
                                          color: const Color(0xff8F8D8D)
                                      ),),
                                    ),
                                    const SizedBox(height: 10,),
                                    cubit.userForumsModel!.data![index].imageUrl==""?
                                    Image(
                                      image: const NetworkImage(
                                          'https://img.freepik.com/free-photo/closeup-hairy-desert-rose-succulent_53876-145028.jpg?w=740&t=st=1660819793~exp=1660820393~hmac=2ce89de317163866d4c27dd25426460d42c0eb4ffabd9954e7c4d627097769a1'

                                      ),
                                      height: 20.h,
                                      width: 33.w,
                                    ):
                                    Image(
                                      image: NetworkImage('https://lavie.orangedigitalcenteregypt.com${cubit.userForumsModel!.data![index].imageUrl}'),
                                      height: 25.h,
                                      width: double.infinity,
                                      fit: BoxFit.fill,
                                    ),


                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  const Image(
                                    image: AssetImage(AssetsManager.like),
                                    height: 50,
                                    width: 30,
                                  ),
                                  Text('0',style: GoogleFonts.roboto(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                      color: ColorManager.grey
                                  ),),
                                  const SizedBox(width: 5,),
                                  Text('Likes',style: GoogleFonts.roboto(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                      color: ColorManager.grey
                                  ),),
                                  SizedBox(width: 17.w,),
                                  Text('2',style: GoogleFonts.roboto(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                      color: ColorManager.grey
                                  ),),
                                  const SizedBox(width: 5,),
                                  Text('Replies',style: GoogleFonts.roboto(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                      color: ColorManager.grey
                                  ),),
                                ],
                              )
                            ],
                          );

                        },
                        separatorBuilder: (context,index){
                          return const SizedBox(height: 10,);
                        },
                        itemCount: cubit.userForumsModel!.data!.length
                    ):
                    Center(
                      child:CircularProgressIndicator(
                        color: ColorManager.primary,
                      ),
                    )

                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: (){
                navigateTo(context, AddPost());

              },
              backgroundColor: ColorManager.primary,
              child: Icon(
                Icons.add,
                color: ColorManager.white,
              ),
            ),

        );
      } ,
    );
  }
}
