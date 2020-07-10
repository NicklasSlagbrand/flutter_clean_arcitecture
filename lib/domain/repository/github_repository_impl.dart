import 'package:flutter_app/data/network/github_network_store.dart';
import 'package:flutter_app/domain/model/models.dart';

class GithubRepositoryImpl {
  final GithubNetworkStore _networkStore;

  GithubRepositoryImpl(this._networkStore);

  Future<List<GithubRepositoryModel>> getGithubRepositories() =>
      _networkStore.getGithubRepositories();
}
