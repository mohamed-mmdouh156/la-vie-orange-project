import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:la_vie_orange/mobile/business_logic/app_cubit/app_cubit.dart';
import 'package:la_vie_orange/mobile/business_logic/app_cubit/app_state.dart';
import 'package:la_vie_orange/mobile/presentation/screens/mobile/blogs_details_screen.dart';
import 'package:la_vie_orange/mobile/presentation/styles/assets_manager.dart';
import 'package:la_vie_orange/mobile/presentation/styles/color_manager.dart';
import 'package:la_vie_orange/mobile/presentation/widget/navigate_to.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BlogsScreen extends StatelessWidget {
  const BlogsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){

        },
      builder: (context,state){
          var cubit=AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
                leading: IconButton(
                  onPressed: (){

                  },
                  icon: const Icon(
                      Icons.arrow_back_outlined
                  ),
                  color: ColorManager.black,
                ),
                centerTitle: true,
                title: Text('Blogs Screen',style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 20.px,
                  color: ColorManager.black,
                ),)
            ),
            body: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context,index){
                          return itemDesign(cubit.plants[index],context);
                        },
                        separatorBuilder: (context,index){
                          return const SizedBox(height: 0,);
                        },
                        itemCount: cubit.plants.length
                    ),
                    const SizedBox(height: 10,),
                    ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context,index){
                          return itemDesign(cubit.seeds[index],context);
                        },
                        separatorBuilder: (context,index){
                          return const SizedBox(height: 0,);
                        },
                        itemCount: cubit.seeds.length
                    ),
                    const SizedBox(height: 10,),
                    ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context,index){
                          return itemDesign(cubit.tools[index],context);
                        },
                        separatorBuilder: (context,index){
                          return const SizedBox(height: 0,);
                        },
                        itemCount: cubit.tools.length
                    ),

                  ],
                ),
              ),
            ),

          );
      },
    );
  }
}


Widget itemDesign(model,context){
  return GestureDetector(
    onTap: (){
      navigateTo(context, BlogsDetailsScreen(model: model,));
    },
    child: Column(
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          clipBehavior: Clip.antiAliasWithSaveLayer,

          decoration: BoxDecoration(

              color: ColorManager.white,
              borderRadius: BorderRadius.circular(15)
          ),
          child: Material(
            elevation: 2,
            clipBehavior: Clip.antiAliasWithSaveLayer,

            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)

            ),
            child: Row(
              children: [
                const SizedBox(width: 10,),

                model.imageUrl==""?
                Image(
                  image: const AssetImage(AssetsManager.imageTest),
                  height: 20.h,
                  width: 33.w,
                ):
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Image(
                    image: NetworkImage('https://lavie.orangedigitalcenteregypt.com${model.imageUrl}'),
                      height: 17.h,
                      width: 33.w,
                      fit: BoxFit.fill,
                    ),
                ),
                const SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10,),
                    Text('2 days ago',style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 13.px,
                      color: ColorManager.primary,
                    ),),
                    const SizedBox(height: 10,),
                    SizedBox(
                      width: 45.w,
                      child: Text('${model.name}',style: GoogleFonts.roboto(
                        fontWeight: FontWeight.w600,
                        fontSize: 17.px,
                        color: ColorManager.black,
                      ),
                        overflow: TextOverflow.ellipsis,

                      ),
                    ),
                    const SizedBox(height: 10,),
                    SizedBox(
                      width: 45.w,
                      child: Text('${model.description}',style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.px,
                        color: ColorManager.lightGrey,
                      ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),



                  ],
                ),
                const SizedBox(width: 10,),

              ],
            ),
          ),
        )
      ],
    ),
  );


}
