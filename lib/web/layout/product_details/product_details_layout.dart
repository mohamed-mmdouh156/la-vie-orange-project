import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_orange/web/app_cubit/cubit.dart';
import 'package:la_vie_orange/web/app_cubit/states.dart';
import 'package:la_vie_orange/web/models/plant_details_model.dart';
import 'package:la_vie_orange/web/reusables/reusables_appbar.dart';

class ProductDetailsLayout extends StatelessWidget {
  String? name, imageUrl, description, id;

  ProductDetailsLayout({this.description, this.name, this.imageUrl, this.id});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WebCubit, WebStates>(
      listener: (context, state) {},
      builder: (context, state) {
        PlantDetailsModel plantDetailsModel;
        plantDetailsModel = WebCubit.get(context).plantDetails!;

        return (WebCubit.get(context).plantDetails != null)
            ? Scaffold(
                body: SingleChildScrollView(
                    child: Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    Image(
                      image: const AssetImage('images/homeBackground.jpeg'),
                      width: MediaQuery.of(context).size.width * 0.45,
                    ),
                    Column(
                      children: [
                        buildAppbar(context),
                        Row(
                          children: [
                            if (imageUrl == '')
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 80.0, top: 100),
                                  child: Image.network(
                                    'images/bestSeller.png',
                                    fit: BoxFit.cover,
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    height: 500,
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
                                      if (loadingProgress == null) return child;

                                      return const SizedBox(
                                        width: 170,
                                        height: 150,
                                        child: Center(
                                            child: CircularProgressIndicator(
                                                strokeWidth: 2,
                                                backgroundColor: Colors.grey)),
                                      );
                                      // You can use LinearProgressIndicator, CircularProgressIndicator, or a GIF instead
                                    },
                                  ),
                                ),
                              ),
                            if (imageUrl != '')
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 80.0, top: 100),
                                  child: Image(
                                    image: NetworkImage(
                                        'https://lavie.orangedigitalcenteregypt.com$imageUrl'),
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    height: 500,
                                    fit: BoxFit.fill,
                                    loadingBuilder:
                                        (context, child, loadingProgress) {
                                      if (loadingProgress == null) return child;

                                      return const SizedBox(
                                        width: 170,
                                        height: 150,
                                        child: Center(
                                            child: CircularProgressIndicator(
                                                strokeWidth: 2,
                                                backgroundColor: Colors.grey)),
                                      );
                                      // You can use LinearProgressIndicator, CircularProgressIndicator, or a GIF instead
                                    },
                                  ),
                                ),
                              ),
                            const SizedBox(
                              width: 50,
                            ),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 18.0),
                                  child: Text(
                                    '$name',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Text(
                                    'EGP ${plantDetailsModel.data!.price!}.00',
                                    style: const TextStyle(
                                        color: Color(0xff1ABC00),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                          width: 85,
                                          height: 80,
                                          color: const Color(0xff9fd9d9)
                                              .withOpacity(0.3),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  children: [
                                                    RichText(
                                                      text: TextSpan(children: [
                                                        TextSpan(
                                                          text:
                                                              '${plantDetailsModel.data!.plant!.sunLight! / 10}',
                                                          style: const TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        WidgetSpan(
                                                          child: Transform
                                                              .translate(
                                                            offset:
                                                                const Offset(
                                                                    2, -4),
                                                            child: const Text(
                                                              '%',
                                                              //superscript is usually smaller in size
                                                              textScaleFactor:
                                                                  0.7,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                        )
                                                      ]),
                                                    ),
                                                    const SizedBox(
                                                      width: 3,
                                                    ),
                                                    const Icon(
                                                      Icons.wb_sunny,
                                                      color:
                                                          Colors.yellowAccent,
                                                      size: 14,
                                                    )
                                                  ],
                                                ),
                                                const Text('Sun light',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500))
                                              ],
                                            ),
                                          )),
                                      const SizedBox(
                                        width: 40,
                                      ),
                                      Container(
                                          width: 85,
                                          height: 80,
                                          color: const Color(0xff9fd9d9)
                                              .withOpacity(0.3),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  children: [
                                                    RichText(
                                                      text: TextSpan(children: [
                                                        TextSpan(
                                                          text:
                                                              '${plantDetailsModel.data!.plant!.waterCapacity! / 10}',
                                                          style: const TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        WidgetSpan(
                                                          child: Transform
                                                              .translate(
                                                            offset:
                                                                const Offset(
                                                                    2, -4),
                                                            child: const Text(
                                                              '%',
                                                              //superscript is usually smaller in size
                                                              textScaleFactor:
                                                                  0.7,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                        )
                                                      ]),
                                                    ),
                                                    const SizedBox(
                                                      width: 3,
                                                    ),
                                                    const Icon(
                                                      Icons.water_drop,
                                                      color: Colors.blueAccent,
                                                      size: 14,
                                                    )
                                                  ],
                                                ),
                                                const Text('Water',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500))
                                              ],
                                            ),
                                          )),
                                      const SizedBox(
                                        width: 40,
                                      ),
                                      Container(
                                          width: 85,
                                          height: 80,
                                          color: const Color(0xff9fd9d9)
                                              .withOpacity(0.3),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  children: [
                                                    RichText(
                                                      text: TextSpan(children: [
                                                        TextSpan(
                                                          text:
                                                              '${plantDetailsModel.data!.plant!.temperature! / 10}',
                                                          style: const TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        WidgetSpan(
                                                          child: Transform
                                                              .translate(
                                                            offset:
                                                                const Offset(
                                                                    2, -4),
                                                            child: const Text(
                                                              'c',
                                                              //superscript is usually smaller in size
                                                              textScaleFactor:
                                                                  0.7,
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ),
                                                        )
                                                      ]),
                                                    ),
                                                    const SizedBox(
                                                      width: 3,
                                                    ),
                                                    const Icon(
                                                      Icons.device_thermostat,
                                                      color: Colors.pink,
                                                      size: 14,
                                                    )
                                                  ],
                                                ),
                                                const Text('Temperature',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500))
                                              ],
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(18.0),
                                  child: Text(
                                    'Information',
                                    style: TextStyle(
                                      color: Color(0xff979797),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 50.0),
                                  child: Text(
                                    '$description',
                                    maxLines: 6,
                                    style: const TextStyle(
                                      color: Color(0xff979797),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Row(
                                    children: [
                                      const Text(
                                        'Qty',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          WebCubit.get(context).increase();
                                        },
                                        child: const Text('+',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            )),
                                      ),
                                      Text('${WebCubit.get(context).quality}'),
                                      TextButton(
                                        onPressed: () {
                                          if (WebCubit.get(context).quality !=
                                              1) {
                                            WebCubit.get(context).decrease();
                                          }
                                        },
                                        child: const Text('-',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: TextButton(
                                      onPressed: () {
                                        WebCubit.get(context).insertItemToCard({
                                          'name': name,
                                          'description': description,
                                          'imageBase64': 'magna cillum enim ad',
                                          "type": "labore sed elit",
                                          "price": "70 EGP",
                                          "itemId": id,
                                        });
                                      },
                                      style: TextButton.styleFrom(
                                        elevation: 5,
                                        fixedSize: Size(
                                            MediaQuery.of(context).size.width,
                                            60),
                                        backgroundColor: const Color(0xff1abc00),
                                      ),
                                      child: const Text(
                                        'Add to Cart',
                                        style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )),
                                ),
                              ],
                            ))
                          ],
                        ),
                      ],
                    )
                  ],
                )),
              )
            : const SizedBox(
                height: 600,
                child: Center(
                    child: CircularProgressIndicator(
                        strokeWidth: 2, backgroundColor: Colors.grey)),
              );
      },
    );
  }
}
