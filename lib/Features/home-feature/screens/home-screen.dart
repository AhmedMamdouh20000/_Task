import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/Features/home-feature/cubit/home-cubit.dart';
import 'package:task/Features/home-feature/cubit/home-state.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/decoration.dart';

class HomePage extends StatelessWidget {
   HomePage({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>HomeCubit()..getPost(),
    child: BlocConsumer<HomeCubit,HomeStates>(
      listener: (context,state){
        if(state is HomeLoading){
           const Center(child: CircularProgressIndicator());
        }
      },
      builder: (context,state){
        var cubit=HomeCubit.get(context);
        return DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              bottom: const TabBar(
                tabs: [
                  Tab(
                    text: "Hot",
                  ),
                  Tab(
                    text: "News",
                  ),
                  Tab(
                    text: "Rising",
                  ),
                ],
              ),
              title: const Text(
                "FlutterDev",
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              actions: const [
                Padding(
                  padding: EdgeInsets.symmetric(),
                ),
              ],
            ),
            body: TabBarView(
              children: [
                ListView.builder(
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () async {
                        const url = 'https://dummyjson.com/posts';
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },

                        child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: const EdgeInsetsDirectional.all(15),
                          margin: const EdgeInsetsDirectional.only( top: 10),
                          decoration: Decorations.kDecorationBoxShadow(radius: 12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '${cubit.posts[index].id   }:',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      '${cubit.posts[index].title  }',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,


                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                '${cubit.posts[index].body}',
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,

                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),

                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: cubit.posts.length,
                ),
                ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: const EdgeInsetsDirectional.all(15),
                        margin: const EdgeInsetsDirectional.only( top: 10),
                        decoration: Decorations.kDecorationBoxShadow(radius: 12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '${cubit.posts[index].id   }:',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    '${cubit.posts[index].title  }',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,


                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${cubit.posts[index].body}',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,

                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),

                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: cubit.posts.length,
                ),
                ListView.builder(
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: const EdgeInsetsDirectional.all(15),
                        margin: const EdgeInsetsDirectional.only( top: 10),
                        decoration: Decorations.kDecorationBoxShadow(radius: 12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '${cubit.posts[index].id   }:',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    '${cubit.posts[index].title  }',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,


                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${cubit.posts[index].body}',
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,

                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),

                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: cubit.posts.length,
                ),
              ],
            ),
          ),
        );
      },
    ),

    );
  }
}
