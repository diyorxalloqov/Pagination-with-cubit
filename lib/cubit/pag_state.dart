import '../model/post_model.dart';

enum PostStatus { initial, loading, success, failure }

class PostState {
  final List<PostModel> posts;
  final bool hasNextPage;
  final bool isLoadingMore;
  final PostStatus status;

  const PostState({
    this.posts = const [],
    this.hasNextPage = true,
    this.isLoadingMore = false,
    this.status = PostStatus.initial,
  });

  PostState copyWith({
    List<PostModel>? posts,
    bool? hasNextPage,
    bool? isLoadingMore,
    PostStatus? status,
  }) {
    return PostState(
      posts: posts ?? this.posts,
      hasNextPage: hasNextPage ?? this.hasNextPage,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      status: status ?? this.status,
    );
  }
}
