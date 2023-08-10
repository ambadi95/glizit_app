import 'dart:async';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import '../dashboard_repository/dashboard_repository.dart';
import '../model/response_data.dart';
import 'dashboard_state.dart';
import 'dashboard_event.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    on<PostsInitialFetchEvent>(postsInitialFetchEvent);

  }

  FutureOr<void> postsInitialFetchEvent(
      PostsInitialFetchEvent event, Emitter<PostsState> emit) async {
    emit(PostsFetchingLoadingState());
    List<Post> posts = await PostsRepo.fetchPosts();
    emit(PostFetchingSuccessfulState(posts: posts));
  }

}