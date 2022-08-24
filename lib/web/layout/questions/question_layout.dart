import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_orange/web/app_cubit/cubit.dart';
import 'package:la_vie_orange/web/app_cubit/states.dart';
import 'package:la_vie_orange/web/layout/home/home_layout.dart';
import 'package:la_vie_orange/web/layout/questions/question_list.dart';
import 'package:la_vie_orange/web/reusables/reusables_appbar.dart';

class QuestionLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WebCubit, WebStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                Image(
                  image: const AssetImage('images/homeBackground.jpeg'),
                  width: MediaQuery.of(context).size.width * 0.45,
                ),
                buildAppbar(context),
                Padding(
                  padding: const EdgeInsets.all(150.0),
                  child: Card(
                      elevation: 5,
                      child: SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                  text: const TextSpan(children: [
                                TextSpan(
                                    text: 'Question of this week.. ',
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold)),
                              ])),
                              myDivider(),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                '${questions[0].question}',
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400),
                              ),
                              for (int i = 0;
                                  i < questions[0].answer!.length;
                                  i++)
                                Container(
                                  width: double.infinity,
                                  height: 58,
                                  margin: const EdgeInsets.all(15.0),
                                  padding: const EdgeInsets.all(3.0),
                                  decoration: BoxDecoration(
                                      color: (WebCubit.get(context).isPressed)
                                          ? (questions[0]
                                                  .answer!
                                                  .entries
                                                  .toList()[i]
                                                  .value)
                                              ? Colors.green
                                              : Colors.red
                                          : Colors.white,
                                      borderRadius:
                                           const BorderRadius.all(Radius.circular(5)),
                                      border:
                                          Border.all(color: const Color(0xff6F6F6F))),
                                  child: TextButton(
                                    onPressed: () {
                                      if (WebCubit.get(context).isPressed ==
                                          false) {
                                        WebCubit.get(context).showAnswer();
                                        if (questions[0]
                                            .answer!
                                            .entries
                                            .toList()[i]
                                            .value) {
                                          WebCubit.get(context).checkTrue();
                                        }

                                        if (questions[0]
                                                .answer!
                                                .entries
                                                .toList()[i]
                                                .value ==
                                            false) {
                                          WebCubit.get(context).checkFalse();
                                        }
                                      }
                                    },
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: Text(
                                          questions[0].answer!.keys.toList()[i],
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                          )),
                                    ),
                                  ),
                                ),
                              if (WebCubit.get(context).isTrue)
                                Row(
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.all(15.0),
                                      child: Text(
                                          'You have background about plant keep going :)',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                          )),
                                    ),
                                    const Spacer(),
                                    Container(
                                      width: 150,
                                      height: 58,
                                      margin: const EdgeInsets.all(15.0),
                                      padding: const EdgeInsets.all(3.0),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(5)),
                                          border: Border.all(
                                              color: const Color(0xff1ABC00))),
                                      child: TextButton(
                                          onPressed: () {
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        HomeLayout()));
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: const [
                                              Text(
                                                'Submit',
                                                style: TextStyle(
                                                  color: Color(0xff1ABC00),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              )
                                            ],
                                          )),
                                    )
                                  ],
                                ),
                              if (WebCubit.get(context).isFalse)
                                Row(
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(left: 15.0),
                                      child: Text(
                                          'You need to read more about planet',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.black,
                                          )),
                                    ),
                                    const Spacer(),
                                    Container(
                                      width: 140,
                                      height: 48,
                                      margin: const EdgeInsets.all(15.0),
                                      padding: const EdgeInsets.all(3.0),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(5)),
                                          border: Border.all(
                                              color: const Color(0xff6F6F6F))),
                                      child: TextButton(
                                          onPressed: () {},
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: const [
                                              Text(
                                                'Read More',
                                                style: TextStyle(
                                                  color: Color(0xff6F6F6F),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              )
                                            ],
                                          )),
                                    ),
                                    Container(
                                      width: 140,
                                      height: 48,
                                      margin: const EdgeInsets.all(15.0),
                                      padding: const EdgeInsets.all(3.0),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(5)),
                                          border: Border.all(
                                              color: const Color(0xff1ABC00))),
                                      child: TextButton(
                                          onPressed: () {
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        HomeLayout()));
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: const [
                                              Text(
                                                'Later',
                                                style: TextStyle(
                                                  color: Color(0xff1ABC00),
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              )
                                            ],
                                          )),
                                    )
                                  ],
                                ),
                            ],
                          ),
                        ),
                      )),
                )
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
