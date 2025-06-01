import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination_f/cubit/pag_state.dart';
import 'package:pagination_f/service/pagination_service.dart';

class PostCubit extends Cubit<PostState> {
  final PostService _postService;
  int _page = 1;
  final int _limit = 20;

  PostCubit(this._postService) : super(const PostState());

  Future<void> loadPosts() async {
    emit(state.copyWith(status: PostStatus.loading));
    try {
      final posts = await _postService.fetchPosts(page: _page, limit: _limit);
      emit(
        state.copyWith(
          posts: posts,
          status: PostStatus.success,
          hasNextPage: posts.length == _limit,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: PostStatus.failure));
    }
  }

  Future<void> loadMorePosts() async {
    if (!state.hasNextPage || state.isLoadingMore) return;

    emit(state.copyWith(isLoadingMore: true));
    _page++;

    try {
      final newPosts = await _postService.fetchPosts(
        page: _page,
        limit: _limit,
      );
      emit(
        state.copyWith(
          posts: [...state.posts, ...newPosts],
          isLoadingMore: false,
          hasNextPage: newPosts.length == _limit,
        ),
      );
    } catch (_) {
      emit(state.copyWith(isLoadingMore: false));
    }
  }
}
