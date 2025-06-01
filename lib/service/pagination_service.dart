import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/post_model.dart';

class PostService {
  final String baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<PostModel>> fetchPosts({
    required int page,
    int limit = 20,
  }) async {
    final response = await http.get(
      Uri.parse('$baseUrl?_page=$page&_limit=$limit'),
    );

    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      return data.map((e) => PostModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
