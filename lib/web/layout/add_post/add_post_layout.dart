import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_orange/web/app_cubit/cubit.dart';
import 'package:la_vie_orange/web/app_cubit/states.dart';
import 'package:la_vie_orange/web/reusables/reusable_text_filed.dart';

class AddPostLayout extends StatelessWidget {
  var uploadPhotoController = TextEditingController();
  var descriptionController = TextEditingController();
  var titleController = TextEditingController();
  var addPostFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WebCubit, WebStates>(
      listener: (context, state) {},
      builder: (context, state) {
        if (WebCubit.get(context).postImage != null) {
          uploadPhotoController = WebCubit.get(context).postImage;
        }

        return Scaffold(
          backgroundColor: Colors.white,
          body: Form(
            key: addPostFormKey,
            child: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Create a New Post',
                    style: TextStyle(
                        color: Color(0xff1abc00),
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Text(
                      "Title",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                          fontSize: 14),
                    ),
                  ),
                  ReusableTextFiled(
                    validator: (value) {
                      if (value.isEmpty) {
                        return "This filed must not be empty";
                      }
                      return null;
                    },
                    onChange: (value) {},
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Text(
                      "Description",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                          fontSize: 14),
                    ),
                  ),
                  Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      height: 200,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "This filed must not be empty";
                          }
                          return null;
                        },
                        maxLines: 10,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                              color: Color(0xff1abc00), width: 1.0),
                        )),
                      )),
                  const SizedBox(
                    height: 25,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Text(
                      "Upload Photo",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                          fontSize: 14),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 4,
                          child: InkWell(
                            onTap: () {},
                            child: TextFormField(
                              controller: uploadPhotoController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "This filed must not be empty";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  enabled: false,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    borderSide: const BorderSide(
                                        color: Color(0xff1abc00), width: 1.0),
                                  )),
                            ),
                          )),
                      const SizedBox(
                        width: 25,
                      ),
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          height: 45,
                          child: TextButton(
                              onPressed: () {
                                WebCubit.get(context).getPostImage2();
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: const Color(0xff1abc00),
                              ),
                              child: const Text(
                                'Upload',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300,
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                  ConditionalBuilder(
                    condition: state is! CreatePostLoadingState,
                    builder: (context) => TextButton(
                        onPressed: () {
                          WebCubit.get(context).createPost(
                              image: WebCubit.get(context).postImage,
                              title: titleController.text,
                              description: descriptionController.text);
                        },
                        style: TextButton.styleFrom(
                          elevation: 5,
                          fixedSize:
                              Size(MediaQuery.of(context).size.width, 45),
                          backgroundColor: const Color(0xff1abc00),
                        ),
                        child: const Text(
                          'Post',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    fallback: (context) => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ],
              ),
            )),
          ),
        );
      },
    );
  }
}
