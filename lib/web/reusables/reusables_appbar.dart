import 'package:flutter/material.dart';
import 'package:la_vie_orange/web/app_cubit/cubit.dart';
import 'package:la_vie_orange/web/layout/Cart/cart_layout.dart';
import 'package:la_vie_orange/web/layout/Forums/forums_layout.dart';
import 'package:la_vie_orange/web/layout/blogs/blogs_layout.dart';
import 'package:la_vie_orange/web/layout/home/home_layout.dart';
import 'package:la_vie_orange/web/layout/my_profile/my_profile_layout.dart';

Color homeColor = const Color(0xff1abc00);
Color shopColor = Colors.black;
Color blogColor = Colors.black;
Color aboutColor = Colors.black;
Color communityColor = Colors.black;

Widget buildAppbar(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Padding(
        padding: const EdgeInsets.only(
          left: 70,
        ),
        child: Image.asset('images/logo.jpeg',
            fit: BoxFit.fill, width: 100, height: 50),
      ),
      const Spacer(),
      Row(
        children: [
          TextButton(
              style: TextButton.styleFrom(padding: const EdgeInsets.all(35)),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeLayout()));
                homeColor = const Color(0xff1abc00);
                shopColor = Colors.black;
                blogColor = Colors.black;
                aboutColor = Colors.black;
                communityColor = Colors.black;
              },
              child: Text(
                'Home',
                style: TextStyle(
                    color: homeColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              )),
          TextButton(
              style: TextButton.styleFrom(padding: const EdgeInsets.all(35)),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartLayout()));
                shopColor = const Color(0xff1abc00);
                blogColor = Colors.black;
                aboutColor = Colors.black;
                communityColor = Colors.black;
                homeColor = Colors.black;
              },
              child: Text(
                'Shop',
                style: TextStyle(
                    color: shopColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              )),
          TextButton(
              style: TextButton.styleFrom(padding: const EdgeInsets.all(35)),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BlogsLayout()));
                blogColor = const Color(0xff1abc00);
                shopColor = Colors.black;
                aboutColor = Colors.black;
                communityColor = Colors.black;
                homeColor = Colors.black;
              },
              child: Text(
                'Blog',
                style: TextStyle(
                    color: blogColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              )),
          TextButton(
              style: TextButton.styleFrom(padding: const EdgeInsets.all(35)),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeLayout()));
                aboutColor = const Color(0xff1abc00);
                blogColor = Colors.black;
                shopColor = Colors.black;
                communityColor = Colors.black;
                homeColor = Colors.black;
              },
              child: Text(
                'About',
                style: TextStyle(
                    color: aboutColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              )),
          TextButton(
              style: TextButton.styleFrom(padding: const EdgeInsets.all(35)),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ForumsLayout()));
                communityColor = const Color(0xff1abc00);
                blogColor = Colors.black;
                aboutColor = Colors.black;
                shopColor = Colors.black;
                homeColor = Colors.black;
              },
              child: Text(
                'Community',
                style: TextStyle(
                    color: communityColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              )),
        ],
      ),
      const Spacer(),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartLayout()));
              },
              icon: const Icon(Icons.shopping_cart),
              iconSize: 20,
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications),
                iconSize: 20),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyProfileLayout()));
              },
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  WebCubit.get(context).currentUserModel!.data!.imageUrl!,
                ),
                radius: 10,
              ),
            )
          ],
        ),
      )
    ],
  );
}
