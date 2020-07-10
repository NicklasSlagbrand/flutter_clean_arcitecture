import 'package:flutter_app/data/http_service.dart';
import 'package:flutter_app/domain/model/github_repo_model.dart';

class GithubNetworkStore {
  final HttpService _httpService;

  GithubNetworkStore(this._httpService);

  Future<List<GithubRepositoryModel>> getGithubRepositories() async {
    final entities = await _httpService.getGithubRepositories();

    return entities
        .map((element) => GithubRepositoryModel(
              name: element.name ?? "",
              description: element.description ?? "",
            ))
        .toList();
  }
}
