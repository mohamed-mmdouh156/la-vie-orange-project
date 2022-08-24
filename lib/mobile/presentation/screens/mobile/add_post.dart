import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:la_vie_orange/mobile/business_logic/app_cubit/app_cubit.dart';
import 'package:la_vie_orange/mobile/business_logic/app_cubit/app_state.dart';
import 'package:la_vie_orange/mobile/presentation/styles/color_manager.dart';
import 'package:la_vie_orange/mobile/presentation/widget/button_manager.dart';
import 'package:la_vie_orange/mobile/presentation/widget/default_form_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddPost extends StatelessWidget {
  AddPost({Key? key}) : super(key: key);
  var titleController=TextEditingController();
  var descriptionController=TextEditingController();


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
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: ColorManager.black,
                ),
                onPressed: (){

                },
              ),
              centerTitle: true,
              title: Text('Create New Post',style: GoogleFonts.roboto(
                  fontSize: 21.px,
                  fontWeight: FontWeight.w700,
                  color: ColorManager.black
              ),),

            ),
            body: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 15
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 7.h,),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 17.h,
                      width: 35.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(
                            color: ColorManager.primary,
                            width: 1
                        ),
                      ),
                      child: InkWell(
                        onTap: (){
                          cubit.getPostImage();
                        },

                        child: cubit.uploadedPostImage ==null? Column(
                          children: [
                            const SizedBox(height: 15,),
                            IconButton(
                              onPressed: (){

                              },
                              icon: Icon(
                                Icons.add,
                                color: ColorManager.primary,
                                size: 30,
                              ),
                            ),
                            const SizedBox(height: 10,),
                            Text('Add Photo',style: GoogleFonts.roboto(
                                fontSize: 16.px,
                                fontWeight: FontWeight.w400,
                                color: ColorManager.primary
                            ),),
                          ],
                        ):
                        Image(
                          image:  FileImage(
                            cubit.uploadedPostImage!
                          ),
                        )
                        ,
                      ),
                    ),
                  ),
                  SizedBox(height: 5.h,),
                  Text('Title',style: GoogleFonts.roboto(
                      color: ColorManager.grey,
                      fontSize: 14.px,
                      fontWeight: FontWeight.w500
                  ),),
                  SizedBox(height: 2.h,),
                  DefaultFormField(
                    controller: titleController,
                    validText: 'Please enter your title',
                  ),
                  SizedBox(height: 4.h,),
                  Text('Description',style: GoogleFonts.roboto(
                      color: ColorManager.grey,
                      fontSize: 14.px,
                      fontWeight: FontWeight.w500
                  ),),
                  SizedBox(height: 2.h,),
                  DefaultFormField(
                    controller: descriptionController,
                    validText: 'Please enter your description',
                  ),
                  SizedBox(height: 2.h,),
                  SizedBox(
                    width: double.infinity,
                    child: ButtonManager(
                      title: 'Post',
                      function: (){
                         cubit.createPost(
                             title: titleController.text,
                             description: descriptionController.text,
                             image: cubit.uploadedPostImage!
                         );
                      },
                    ),
                  )
                ],
              ),
            ),
          );
      },

    );
  }
}
