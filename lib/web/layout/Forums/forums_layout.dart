import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie_orange/web/app_cubit/cubit.dart';
import 'package:la_vie_orange/web/app_cubit/states.dart';
import 'package:la_vie_orange/web/layout/add_post/add_post_layout.dart';
import 'package:la_vie_orange/web/models/forums_model.dart';
import 'package:la_vie_orange/web/models/my_forums_model.dart';
import 'package:la_vie_orange/web/reusables/reusable_text_filed.dart';
import 'package:la_vie_orange/web/reusables/reusables_appbar.dart';

class ForumsLayout extends StatelessWidget {
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
                Column(
                  children: [
                    buildAppbar(context),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        const Text(
                          'Forums',
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
                              padding: const EdgeInsets.only(
                                  left: 30, right: 30, top: 10),
                              child: TextButton(
                                  onPressed: () {
                                    if (WebCubit.get(context).isAllForums ==
                                        false) {
                                      WebCubit.get(context).changeForumsType();
                                    }
                                  },
                                  style: TextButton.styleFrom(
                                    fixedSize: const Size(150, 50),
                                  ),
                                  child: Text(
                                    'All Forums',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: (WebCubit.get(context).isAllForums)
                                          ? const Color(0xff1abc00)
                                          : Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 30, right: 30, top: 10),
                              child: TextButton(
                                  onPressed: () {
                                    if (WebCubit.get(context).isAllForums) {
                                      WebCubit.get(context).changeForumsType();
                                    }
                                  },
                                  style: TextButton.styleFrom(
                                    fixedSize: const Size(150, 50),
                                  ),
                                  child: Text(
                                    'My Forums',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color:
                                          (WebCubit.get(context).isAllForums ==
                                                  false)
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
                              width: 45,
                            ),
                            Container(
                              color: (WebCubit.get(context).isAllForums)
                                  ? const Color(0xff1abc00)
                                  : const Color(0xff1abc00).withOpacity(0),
                              height: 1.5,
                              width: 110,
                            ),
                            const SizedBox(
                              width: 110,
                            ),
                            Container(
                              color: (WebCubit.get(context).isAllForums)
                                  ? const Color(0xff1abc00).withOpacity(0)
                                  : const Color(0xff1abc00),
                              height: 1.5,
                              width: 110,
                            ),
                          ],
                        ),
                        myDivider(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            (WebCubit.get(context).isAllForums)
                                ? Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        height: 500,
                                        child: ListView.separated(
                                          physics:
                                              const BouncingScrollPhysics(),
                                          itemBuilder: (context, index) =>
                                              buildAllForums(
                                                  WebCubit.get(context)
                                                      .forumsModel!
                                                      .data![index]),
                                          separatorBuilder: (context, index) =>
                                              const SizedBox(
                                            height: 6,
                                          ),
                                          itemCount: WebCubit.get(context)
                                              .forumsModel!
                                              .data!
                                              .length,
                                        ),
                                      ),
                                    ))
                                : Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        height: 500,
                                        child: ListView.separated(
                                          physics:
                                              const BouncingScrollPhysics(),
                                          itemBuilder: (context, index) =>
                                              buildMyForums(
                                                  WebCubit.get(context)
                                                      .myForumsModel!
                                                      .data![index],
                                                  context),
                                          separatorBuilder: (context, index) =>
                                              const SizedBox(
                                            height: 6,
                                          ),
                                          itemCount: WebCubit.get(context)
                                              .myForumsModel!
                                              .data!
                                              .length,
                                        ),
                                      ),
                                    )),
                            Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Card(
                                    elevation: 4,
                                    child: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 40,
                                              child: ReusableTextFiled(
                                                prefixIcon: const Icon(
                                                  Icons.search,
                                                ),
                                                hintText: 'Search in Forums',
                                                onChange: (value) {},
                                                validator: () {},
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 40,
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
                                                      fontWeight:
                                                          FontWeight.w300,
                                                    ),
                                                  )),
                                            ),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            myDivider(),
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: const Color(
                                                        0xff1abc00)),
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(10)),
                                              ),
                                              child: TextButton(
                                                  onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                AddPostLayout()));
                                                  },
                                                  style: TextButton.styleFrom(),
                                                  child: const Text(
                                                    'Add Post',
                                                    style: TextStyle(
                                                      color: Color(0xff1abc00),
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                    ),
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ))
                          ],
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildMyForums(MyForumsData myForumsData, context) {
    return Card(
      elevation: 10,
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(3),
              child: Card(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2),
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                '${WebCubit.get(context).currentUserModel!.data!.imageUrl}'),
                            radius: 24,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    '${myForumsData.user!.firstName} ${myForumsData.user!.lastName}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                                const SizedBox(
                                  height: 3,
                                ),
                                Text('12:50 pm 20:8:2022',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: Colors.grey.shade500)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    myDivider(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(7),
                          child: Text(
                            "${myForumsData.title}",
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(17),
                          child: Text(
                            "${myForumsData.description}",
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                                fontSize: 14),
                          ),
                        ),
                        //    if (postModel.postImage != '')
                        if (myForumsData.imageUrl == '') const SizedBox(),
                        if (myForumsData.imageUrl != '')
                          Padding(
                            padding: const EdgeInsets.all(7.0),
                            child: Image.network(
                              'https://lavie.orangedigitalcenteregypt.com${myForumsData.imageUrl}',
                              fit: BoxFit.fill,
                              width: double.infinity,
                              height: 450,
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;

                                return const SizedBox(
                                  width: double.infinity,
                                  height: 450,
                                  child: Center(
                                      child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    backgroundColor: Colors.grey,
                                    color: Color(0xff1abc00),
                                  )),
                                );
                                // You can use LinearProgressIndicator, CircularProgressIndicator, or a GIF instead
                              },
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 7),
                          child: Row(
                            children: [
                              Expanded(
                                  child: InkWell(
                                onTap: () {},
                                highlightColor: Colors.blue.shade300,
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.favorite_border,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(
                                      width: 4,
                                    ),
                                    Text("Like")
                                  ],
                                ),
                              )),
                              Expanded(
                                  child: InkWell(
                                onTap: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) => CommentPage(postId:   SocialCubit.get(context).postId[index],
                                  //
                                  //         )));
                                },
                                highlightColor: Colors.blue.shade300,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(
                                      Icons.comment,
                                      color: Colors.grey.shade700,
                                    ),
                                    Text(
                                        "${myForumsData.forumComments!.length} Comment")
                                  ],
                                ),
                              ))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 0),
                          child: Card(
                              elevation: 0,
                              color: Colors.grey.shade50,
                              child: InkWell(
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          '${myForumsData.user!.imageUrl}'),
                                    ),
                                    Expanded(
                                        child: Container(
                                      height: 60,
                                      padding: const EdgeInsets.all(12),
                                      child: TextFormField(
                                        enabled: false,
                                        decoration: InputDecoration(
                                          labelText: 'Write a comment',
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        ),
                                      ),
                                    )),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.comment,
                                          size: 28,
                                          color: Colors.black,
                                        ))
                                  ],
                                ),
                                onTap: () {},
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildAllForums(ForumsData forumsData) {
    return Card(
      elevation: 10,
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(3),
              child: Card(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2),
                          child: CircleAvatar(
                            backgroundImage:
                                NetworkImage('${forumsData.user!.imageUrl}'),
                            radius: 24,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    '${forumsData.user!.firstName} ${forumsData.user!.lastName}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                                const SizedBox(
                                  height: 3,
                                ),
                                Text('12:50 pm 20:8:2022',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                        color: Colors.grey.shade500)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    myDivider(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(7),
                          child: Text(
                            "${forumsData.title}",
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(17),
                          child: Text(
                            "${forumsData.description}",
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey,
                                fontSize: 14),
                          ),
                        ),
                        //    if (postModel.postImage != '')
                        if (forumsData.imageUrl == '') const SizedBox(),
                        if (forumsData.imageUrl != '')
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.network(
                              'https://lavie.orangedigitalcenteregypt.com${forumsData.imageUrl}',
                              fit: BoxFit.fill,
                              width: double.infinity,
                              height: 450,
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;

                                return const SizedBox(
                                  width: double.infinity,
                                  height: 450,
                                  child: Center(
                                      child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    backgroundColor: Colors.grey,
                                    color: Color(0xff1abc00),
                                  )),
                                );
                                // You can use LinearProgressIndicator, CircularProgressIndicator, or a GIF instead
                              },
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 7),
                          child: Row(
                            children: [
                              Expanded(
                                  child: InkWell(
                                onTap: () {},
                                highlightColor: Colors.blue.shade300,
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.favorite_border,
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(
                                      width: 4,
                                    ),
                                    Text(
                                        "${(forumsData.forumLikes!.isNotEmpty) ? forumsData.forumLikes!.length : ''}Like")
                                  ],
                                ),
                              )),
                              Expanded(
                                  child: InkWell(
                                onTap: () {},
                                highlightColor: Colors.blue.shade300,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(
                                      Icons.comment,
                                      color: Colors.grey.shade700,
                                    ),
                                    Text(
                                        "${(forumsData.forumComments!.isNotEmpty) ? forumsData.forumComments!.length : ''} Comment")
                                  ],
                                ),
                              ))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 0),
                          child: Card(
                              elevation: 0,
                              color: Colors.grey.shade50,
                              child: InkWell(
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          '${forumsData.user!.imageUrl}'),
                                    ),
                                    Expanded(
                                        child: Container(
                                      height: 60,
                                      padding: const EdgeInsets.all(12),
                                       child: TextFormField(
                                        enabled: false,
                                        decoration: InputDecoration(
                                          labelText: 'Write a comment',
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        ),
                                      ),
                                    )),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.comment,
                                          size: 28,
                                          color: Colors.black,
                                        ))
                                  ],
                                ),
                                onTap: () {},
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget myDivider() => Container(
        color: Colors.grey.withOpacity(0.4),
        height: 1,
        width: double.infinity,
      );
}
