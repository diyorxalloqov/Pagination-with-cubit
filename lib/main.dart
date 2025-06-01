import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination_f/cubit/pag_cubit.dart';
import 'package:pagination_f/service/pagination_service.dart';
import 'package:pagination_f/ui/post.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final PostService postService = PostService();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => PostCubit(postService),
        child: const PostPage(),
      ),
    );
  }
}
