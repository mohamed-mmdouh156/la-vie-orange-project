import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_orange/web/app_cubit/cubit.dart';
import 'package:la_vie_orange/web/app_cubit/states.dart';
import 'package:la_vie_orange/web/models/blogs_model.dart';
import 'package:la_vie_orange/web/reusables/reusables_appbar.dart';

class BlogsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WebCubit, WebStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return (WebCubit.get(context).blogsModel != null)
            ? LayoutBuilder(builder: (context, constraints) {
                if (constraints.minWidth.toInt() >= 1330) {
                  return Scaffold(
                    body: ListView(
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            Image(
                              image: const AssetImage(
                                  'images/homeBackground.jpeg'),
                              width: MediaQuery.of(context).size.width * 0.45,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                buildAppbar(context),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Row(
                                    children: [
                                      const Text(
                                        "Blogs",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Expanded(
                                          flex: 5,
                                          child: Padding(
                                            padding: const EdgeInsets.all(25.0),
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                hintText: 'Search in Blogs',
                                                prefixIcon:
                                                    const Icon(Icons.search),
                                                prefixIconColor:
                                                    const Color(0xff1abc00),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  borderSide: const BorderSide(
                                                      color: Color(0xff1abc00),
                                                      width: 1.0),
                                                ),
                                              ),
                                            ),
                                          )),
                                      Expanded(
                                        flex: 1,
                                        child: SizedBox(
                                          height: 50,
                                          child: TextButton(
                                              onPressed: () {},
                                              style: TextButton.styleFrom(
                                                backgroundColor:
                                                    const Color(0xff1abc00),
                                              ),
                                              child: const Text(
                                                'Search',
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
                                const SizedBox(
                                  height: 15,
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: Text(
                                    "Plants",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: GridView.count(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    crossAxisCount: 5,
                                    mainAxisSpacing: 1.0,
                                    crossAxisSpacing: 1.0,
                                    childAspectRatio: 1 / 0.98,
                                    children: List.generate(
                                      WebCubit.get(context)
                                          .blogsModel!
                                          .data!
                                          .plants!
                                          .length,
                                      (index) => builderBlogsPlants(
                                          WebCubit.get(context)
                                              .blogsModel!
                                              .data!
                                              .plants![index]),
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: Text(
                                    "Seeds",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: GridView.count(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    crossAxisCount: 5,
                                    mainAxisSpacing: 1.0,
                                    crossAxisSpacing: 1.0,
                                    childAspectRatio: 1 / 0.98,
                                    children: List.generate(
                                      WebCubit.get(context)
                                          .blogsModel!
                                          .data!
                                          .seeds!
                                          .length,
                                      (index) => builderBlogsSeeds(
                                          WebCubit.get(context)
                                              .blogsModel!
                                              .data!
                                              .seeds![index]),
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: Text(
                                    "Tools",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: GridView.count(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    crossAxisCount: 5,
                                    mainAxisSpacing: 1.0,
                                    crossAxisSpacing: 1.0,
                                    childAspectRatio: 1 / 0.98,
                                    children: List.generate(
                                      WebCubit.get(context)
                                          .blogsModel!
                                          .data!
                                          .tools!
                                          .length,
                                      (index) => builderBlogsTools(
                                          WebCubit.get(context)
                                              .blogsModel!
                                              .data!
                                              .tools![index]),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  );
                } else if (constraints.minWidth.toInt() >= 1055) {
                  return Scaffold(
                    body: ListView(
                      children: [
                        Stack(
                          alignment: AlignmentDirectional.topEnd,
                          children: [
                            Image(
                              image: const AssetImage(
                                  'images/homeBackground.jpeg'),
                              width: MediaQuery.of(context).size.width * 0.45,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                buildAppbar(context),
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Row(
                                    children: [
                                      const Text(
                                        "Blogs",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Expanded(
                                          flex: 5,
                                          child: Padding(
                                            padding: const EdgeInsets.all(25.0),
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                hintText: 'Search in Blogs',
                                                prefixIcon:
                                                    const Icon(Icons.search),
                                                prefixIconColor:
                                                    const Color(0xff1abc00),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  borderSide: const BorderSide(
                                                      color: Color(0xff1abc00),
                                                      width: 1.0),
                                                ),
                                              ),
                                            ),
                                          )),
                                      Expanded(
                                        flex: 1,
                                        child: SizedBox(
                                          height: 50,
                                          child: TextButton(
                                              onPressed: () {},
                                              style: TextButton.styleFrom(
                                                backgroundColor:
                                                    const Color(0xff1abc00),
                                              ),
                                              child: const Text(
                                                'Search',
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
                                const Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: Text(
                                    "Plants",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: GridView.count(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    crossAxisCount: 4,
                                    mainAxisSpacing: 1.0,
                                    crossAxisSpacing: 1.0,
                                    childAspectRatio: 1 / 0.98,
                                    children: List.generate(
                                      WebCubit.get(context)
                                          .blogsModel!
                                          .data!
                                          .plants!
                                          .length,
                                      (index) => builderBlogsPlants(
                                          WebCubit.get(context)
                                              .blogsModel!
                                              .data!
                                              .plants![index]),
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: Text(
                                    "Seeds",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: GridView.count(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    crossAxisCount: 4,
                                    mainAxisSpacing: 1.0,
                                    crossAxisSpacing: 1.0,
                                    childAspectRatio: 1 / 0.98,
                                    children: List.generate(
                                      WebCubit.get(context)
                                          .blogsModel!
                                          .data!
                                          .seeds!
                                          .length,
                                      (index) => builderBlogsSeeds(
                                          WebCubit.get(context)
                                              .blogsModel!
                                              .data!
                                              .seeds![index]),
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: Text(
                                    "Tools",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: GridView.count(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    crossAxisCount: 4,
                                    mainAxisSpacing: 1.0,
                                    crossAxisSpacing: 1.0,
                                    childAspectRatio: 1 / 0.98,
                                    children: List.generate(
                                      WebCubit.get(context)
                                          .blogsModel!
                                          .data!
                                          .tools!
                                          .length,
                                      (index) => builderBlogsTools(
                                          WebCubit.get(context)
                                              .blogsModel!
                                              .data!
                                              .tools![index]),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  );
                }
                return Scaffold(
                  body: ListView(
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.topEnd,
                        children: [
                          Image(
                            image:
                                const AssetImage('images/homeBackground.jpeg'),
                            width: MediaQuery.of(context).size.width * 0.45,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildAppbar(context),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  children: [
                                    const Text(
                                      "Blogs",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Expanded(
                                        flex: 5,
                                        child: Padding(
                                          padding: const EdgeInsets.all(25.0),
                                          child: TextFormField(
                                            decoration: InputDecoration(
                                              hintText: 'Search in Blogs',
                                              prefixIcon:
                                                  const Icon(Icons.search),
                                              prefixIconColor:
                                                  const Color(0xff1abc00),
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                borderSide: const BorderSide(
                                                    color: Color(0xff1abc00),
                                                    width: 1.0),
                                              ),
                                            ),
                                          ),
                                        )),
                                    Expanded(
                                      flex: 1,
                                      child: SizedBox(
                                        height: 50,
                                        child: TextButton(
                                            onPressed: () {},
                                            style: TextButton.styleFrom(
                                              backgroundColor:
                                                  const Color(0xff1abc00),
                                            ),
                                            child: const Text(
                                              'Search',
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
                              const Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Text(
                                  "Plants",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                child: GridView.count(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 1.0,
                                  crossAxisSpacing: 1.0,
                                  childAspectRatio: 1 / 0.87,
                                  children: List.generate(
                                    WebCubit.get(context)
                                        .blogsModel!
                                        .data!
                                        .plants!
                                        .length,
                                    (index) => builderBlogsPlants(
                                        WebCubit.get(context)
                                            .blogsModel!
                                            .data!
                                            .plants![index]),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Text(
                                  "Seeds",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                child: GridView.count(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 1.0,
                                  crossAxisSpacing: 1.0,
                                  childAspectRatio: 1 / 0.87,
                                  children: List.generate(
                                    WebCubit.get(context)
                                        .blogsModel!
                                        .data!
                                        .seeds!
                                        .length,
                                    (index) => builderBlogsSeeds(
                                        WebCubit.get(context)
                                            .blogsModel!
                                            .data!
                                            .seeds![index]),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(15.0),
                                child: Text(
                                  "Tools",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                child: GridView.count(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 1.0,
                                  crossAxisSpacing: 1.0,
                                  childAspectRatio: 1 / 0.87,
                                  children: List.generate(
                                    WebCubit.get(context)
                                        .blogsModel!
                                        .data!
                                        .tools!
                                        .length,
                                    (index) => builderBlogsTools(
                                        WebCubit.get(context)
                                            .blogsModel!
                                            .data!
                                            .tools![index]),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                );
              })
            : const SizedBox(
                height: 600,
                child: Center(
                    child: CircularProgressIndicator(
                        strokeWidth: 2, backgroundColor: Colors.grey)),
              );
      },
    );
  }

  Widget builderBlogsPlants(Plants plants) => InkWell(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Card(
            elevation: 3,
            child: Container(
              child: ListView(
                children: [
                  if (plants.imageUrl == '')
                    Image.network(
                      'images/blogs.png',
                      fit: BoxFit.cover,
                      width: 240,
                      height: 140,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;

                        return const SizedBox(
                          width: 200,
                          height: 140,
                          child: Center(
                              child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  backgroundColor: Colors.grey)),
                        );
                        // You can use LinearProgressIndicator, CircularProgressIndicator, or a GIF instead
                      },
                    ),
                  if (plants.imageUrl != '')
                    Image.network(
                      'https://lavie.orangedigitalcenteregypt.com${plants.imageUrl}',
                      fit: BoxFit.cover,
                      width: 240,
                      height: 140,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;

                        return const SizedBox(
                          width: 200,
                          height: 140,
                          child: Center(
                              child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  backgroundColor: Colors.grey)),
                        );
                      },
                    ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      '${plants.name}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      '${plants.description}',
                      style: const TextStyle(
                        color: Color(0xff7D7B7B),
                        fontSize: 12,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        onTap: () {},
      );

  Widget builderBlogsSeeds(Seeds seeds) => InkWell(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Card(
            elevation: 3,
            child: Container(
              child: ListView(
                children: [
                  if (seeds.imageUrl == '')
                    Image.network(
                      'images/blogs.png',
                      fit: BoxFit.cover,
                      width: 240,
                      height: 140,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;

                        return const SizedBox(
                          width: 200,
                          height: 140,
                          child: Center(
                              child:  CircularProgressIndicator(
                                  strokeWidth: 2,
                                  backgroundColor: Colors.grey)),
                        );
                        // You can use LinearProgressIndicator, CircularProgressIndicator, or a GIF instead
                      },
                    ),
                  if (seeds.imageUrl != '')
                    Image.network(
                      'https://lavie.orangedigitalcenteregypt.com${seeds.imageUrl}',
                      fit: BoxFit.cover,
                      width: 240,
                      height: 140,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;

                        return const SizedBox(
                          width: 200,
                          height: 140,
                          child: Center(
                              child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  backgroundColor: Colors.grey)),
                        );
                        // You can use LinearProgressIndicator, CircularProgressIndicator, or a GIF instead
                      },
                    ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      '${seeds.name}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      '${seeds.description}',
                      style: const TextStyle(
                        color: Color(0xff7D7B7B),
                        fontSize: 12,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        onTap: () {},
      );

  Widget builderBlogsTools(Tools tools) => InkWell(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Card(
            elevation: 3,
            child: Container(
              child: ListView(
                children: [
                  if (tools.imageUrl == '')
                    Image.network(
                      'images/blogs.png',
                      fit: BoxFit.cover,
                      width: 240,
                      height: 140,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;

                        return const SizedBox(
                          width: 200,
                          height: 140,
                          child: Center(
                              child:  CircularProgressIndicator(
                                  strokeWidth: 2,
                                  backgroundColor: Colors.grey)),
                        );
                        // You can use LinearProgressIndicator, CircularProgressIndicator, or a GIF instead
                      },
                    ),
                  if (tools.imageUrl != '')
                    Image.network(
                      'https://lavie.orangedigitalcenteregypt.com${tools.imageUrl}',
                      fit: BoxFit.cover,
                      width: 240,
                      height: 140,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;

                        return const SizedBox(
                          width: 200,
                          height: 140,
                          child: Center(
                              child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  backgroundColor: Colors.grey)),
                        );
                        // You can use LinearProgressIndicator, CircularProgressIndicator, or a GIF instead
                      },
                    ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      '${tools.name}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      '${tools.name}',
                      style: const TextStyle(
                        color: Color(0xff7D7B7B),
                        fontSize: 12,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        onTap: () {},
      );
}
