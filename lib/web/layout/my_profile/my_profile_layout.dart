import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_orange/web/app_cubit/cubit.dart';
import 'package:la_vie_orange/web/app_cubit/states.dart';
import 'package:la_vie_orange/web/reusables/reusable_text_filed.dart';
import 'package:la_vie_orange/web/reusables/reusables_appbar.dart';

class MyProfileLayout extends StatelessWidget {
  var addressController = TextEditingController();
  var uploadPhotoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WebCubit, WebStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                buildAppbar(context),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'My Profile',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 30, right: 30, top: 10),
                      child: TextButton(
                          onPressed: () {
                            if (WebCubit.get(context).isChangeProfile) {
                              WebCubit.get(context).changeInfoType();
                            }
                          },
                          style: TextButton.styleFrom(
                            fixedSize: const Size(170, 50),
                          ),
                          child: Text(
                            'Personal Information',
                            style: TextStyle(
                              fontSize: 16,
                              color: (WebCubit.get(context).isChangeProfile ==
                                      false)
                                  ? const Color(0xff1abc00)
                                  : Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 30, right: 30, top: 10),
                      child: TextButton(
                          onPressed: () {
                            if (WebCubit.get(context).isChangeProfile ==
                                false) {
                              WebCubit.get(context).changeInfoType();
                            }
                          },
                          style: TextButton.styleFrom(
                            fixedSize: const Size(150, 50),
                          ),
                          child: Text(
                            'Profile picture',
                            style: TextStyle(
                              fontSize: 16,
                              color: (WebCubit.get(context).isChangeProfile)
                                  ? const Color(0xff1abc00)
                                  : Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          )),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 40,
                    ),
                    Container(
                      color: (WebCubit.get(context).isChangeProfile == false)
                          ? const Color(0xff1abc00)
                          : const Color(0xff1abc00).withOpacity(0),
                      height: 1.5,
                      width: 140,
                    ),
                    const SizedBox(
                      width: 100,
                    ),
                    Container(
                      color: (WebCubit.get(context).isChangeProfile == false)
                          ? const Color(0xff1abc00).withOpacity(0)
                          : const Color(0xff1abc00),
                      height: 1.5,
                      width: 110,
                    ),
                  ],
                ),
                myDivider(),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Container(
                    color: const Color(0xffe8f1e6),
                    height: 50,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 30),
                          child: Image.asset('images/points_image.png',
                              fit: BoxFit.fill, width: 40, height: 40),
                        ),
                        const Text(
                          'You have 30 points',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                (WebCubit.get(context).isChangeProfile == false)
                    ? Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'First Name',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xff6F6F6F),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      ReusableTextFiled(
                                        onChange: (val) {},
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return "Must not be empty";
                                          }

                                          return null;
                                        },
                                        textController: WebCubit.get(context)
                                            .currentFirstNameController,
                                      ),
                                    ],
                                  )),
                                  const SizedBox(width: 25),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Second Name',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xff6F6F6F),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        ReusableTextFiled(
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return "Must not be empty";
                                            }

                                            return null;
                                          },
                                          textController: WebCubit.get(context)
                                              .currentSecondNameController,
                                          onChange: (value) {},
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Email',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Color(0xff6F6F6F),
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      ReusableTextFiled(
                                        onChange: (val) {},
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return "Must not be empty";
                                          }

                                          return null;
                                        },
                                        textController: WebCubit.get(context)
                                            .currentEmailController,
                                      ),
                                    ],
                                  )),
                                  const SizedBox(width: 25),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Address',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xff6F6F6F),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        ReusableTextFiled(
                                          hintText: 'Address',
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return "Must not be empty";
                                            }

                                            return null;
                                          },
                                          textController: addressController,
                                          onChange: (value) {},
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              margin: const EdgeInsets.all(15.0),
                              padding: const EdgeInsets.all(3.0),
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                  border: Border.all(
                                      color: const Color(0xff6F6F6F))),
                              height: 200,
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: const Icon(
                                Icons.add,
                                size: 35,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Row(
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
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              borderSide: const BorderSide(
                                                  color: Color(0xff1abc00),
                                                  width: 1.0),
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
                                          backgroundColor:
                                              const Color(0xff1abc00),
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
                          ),
                        ],
                      ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                    onPressed: () {
                      WebCubit.get(context).updateCurrentUser(
                        email:
                            WebCubit.get(context).currentEmailController.text,
                        address: addressController.text ?? '',
                        firstName: WebCubit.get(context)
                            .currentFirstNameController
                            .text,
                        lastName: WebCubit.get(context)
                            .currentSecondNameController
                            .text,
                      );
                    },
                    style: TextButton.styleFrom(
                      fixedSize: const Size(172, 40),
                      backgroundColor: const Color(0xff1abc00),
                    ),
                    child: const Text(
                      'Save',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                    )),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget myDivider() => Container(
        color: Colors.grey.withOpacity(0.4),
        height: 1,
        width: double.infinity,
      );
}
