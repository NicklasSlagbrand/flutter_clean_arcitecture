import 'package:flutter_app/data/entity/github_repo_entity.dart';

import 'package:http/http.dart';
import 'dart:convert';

class HttpService {
  final String baseURL;

  HttpService({this.baseURL = "https://api.github.com"});

  Future<List<GithubRepositoryEntity>> getGithubRepositories() async {
    var res = await get('$baseURL/orgs/android/repos');

    if (res.statusCode == 200) {
      final jsonIterable = jsonDecode(res.body) as List<dynamic>;

      return jsonIterable
          .map((itemJson) => GithubRepositoryEntity.fromJson(itemJson))
          .toList();
    } else {
      throw "Can't get Github Repos";
    }
  }
}
