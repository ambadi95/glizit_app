import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glizit_app/features/screens/dashboard/view/video.dart';
import '../bloc/dashboard_bloc.dart';
import '../bloc/dashboard_event.dart';
import '../bloc/dashboard_state.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final PostsBloc postsBloc = PostsBloc();

  @override
  void initState() {
    postsBloc.add(PostsInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          title: const Text('Dashboard'),
          centerTitle: true,
        ),
        body: BlocConsumer<PostsBloc, PostsState>(
          bloc: postsBloc,
          listenWhen: (previous, current) => current is PostsActionState,
          buildWhen: (previous, current) => current is! PostsActionState,
          listener: (context, state) {},
          builder: (context, state) {
            switch (state.runtimeType) {
              case PostsFetchingLoadingState:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case PostFetchingSuccessfulState:
                final successState = state as PostFetchingSuccessfulState;

                return ListView.builder(
                  itemCount: successState.posts.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  VideoPlayerScreen(
                              post:  successState.posts[index],
                            ))
                        );
                      },
                      child: Container(
                        color: Colors.grey.shade200,
                        padding: const EdgeInsets.all(16),
                        margin: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              successState.posts[index].title!,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Image.network(
                                successState.posts[index].thumbnailUrl!,
                                errorBuilder: (BuildContext context,
                                    Object exception, StackTrace? stackTrace) {
                              return const SizedBox();
                            }),
                            Text(
                              successState.posts[index].description!,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              default:
                return const SizedBox();
            }
          },
        ));
  }
}
