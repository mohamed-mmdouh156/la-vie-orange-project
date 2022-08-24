import 'package:flutter/material.dart';
import 'package:la_vie_orange/web/reusables/reusables_appbar.dart';

class CartLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              Image(
                image: const AssetImage('images/homeBackground.jpeg'),
                width: MediaQuery.of(context).size.width * 0.45,
              ),
              Column(
                children: [
                  buildAppbar(context),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'My Cart',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                Card(
                                  elevation: 4,
                                  child: Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Image(
                                            image: AssetImage(
                                                'images/blogs.png'),
                                            width: 100,
                                            height: 80,
                                            fit: BoxFit.fill,
                                          ),
                                          Row(
                                            children: [
                                              TextButton(
                                                onPressed: () {},
                                                child: const Text('+',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    )),
                                              ),
                                              const Text('1'),
                                              TextButton(
                                                onPressed: () {},
                                                child: const Text('-',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    )),
                                              ),
                                            ],
                                          ),
                                          const Text('300 EGP'),
                                          const Icon(
                                            Icons.delete,
                                            color: Colors.green,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Card(
                                  elevation: 4,
                                  child: Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Image(
                                            image: AssetImage(
                                                'images/blogs.png'),
                                            width: 100,
                                            height: 80,
                                            fit: BoxFit.fill,
                                          ),
                                          Row(
                                            children: [
                                              TextButton(
                                                onPressed: () {},
                                                child: const Text('+',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    )),
                                              ),
                                              const Text('1'),
                                              TextButton(
                                                onPressed: () {},
                                                child: const Text('-',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    )),
                                              ),
                                            ],
                                          ),
                                          const Text('300 EGP'),
                                          const Icon(
                                            Icons.delete,
                                            color: Colors.green,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Card(
                                  elevation: 4,
                                  child: Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Image(
                                            image: AssetImage(
                                                'images/blogs.png'),
                                            width: 100,
                                            height: 80,
                                            fit: BoxFit.fill,
                                          ),
                                          Row(
                                            children: [
                                              TextButton(
                                                onPressed: () {},
                                                child: const Text('+',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    )),
                                              ),
                                              const Text('1'),
                                              TextButton(
                                                onPressed: () {},
                                                child: const Text('-',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    )),
                                              ),
                                            ],
                                          ),
                                          const Text('300 EGP'),
                                          const Icon(
                                            Icons.delete,
                                            color: Colors.green,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Card(
                                  elevation: 4,
                                  child: Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Image(
                                            image:
                                                AssetImage('images/blogs.png'),
                                            width: 100,
                                            height: 80,
                                            fit: BoxFit.fill,
                                          ),
                                          Row(
                                            children: [
                                              TextButton(
                                                onPressed: () {},
                                                child: const Text('+',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    )),
                                              ),
                                              const Text('1'),
                                              TextButton(
                                                onPressed: () {},
                                                child: const Text('-',
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    )),
                                              ),
                                            ],
                                          ),
                                          const Text('300 EGP'),
                                          const Icon(
                                            Icons.delete,
                                            color: Colors.green,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                              flex: 1,
                              child: Card(
                                elevation: 4,
                                child: Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: const [
                                             Text(
                                              'Sub Total',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text('1200 EGP'),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: const [
                                             Text(
                                              'Shipping',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                             Text('0 EGP'),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        myDivider(),
                                        const SizedBox(
                                          height: 35,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: const [
                                             Text(
                                              'Total',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                             Text(
                                              '1200 EGP',
                                              style: TextStyle(
                                                  color:
                                                      Color(0xff1ABC00),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 35,
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 60,
                                          decoration: const BoxDecoration(
                                            color: Color(0xff1ABC00),
                                            borderRadius:
                                                 BorderRadius.all(
                                                    Radius.circular(10)),
                                          ),
                                          child: TextButton(
                                              onPressed: () {},
                                              style: TextButton.styleFrom(
                                                backgroundColor:
                                                    const Color(0xff1abc00),
                                              ),
                                              child: const Text(
                                                'Checkout',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ))
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget myDivider() => Container(
        color: Colors.grey.withOpacity(0.4),
        height: 1,
        width: double.infinity,
      );
}
