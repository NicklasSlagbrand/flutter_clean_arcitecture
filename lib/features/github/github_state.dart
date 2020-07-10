part of 'list/github_list_bloc.dart';

@immutable
abstract class GithubState extends Equatable {
  const GithubState();
}

class InitialGithubListState extends GithubState {
  const InitialGithubListState();

  @override
  List<Object> get props => [];
}

class GithubListLoaded extends GithubState {
  final List<GithubRepoItem> repos;

  @override
  List<Object> get props => [repos];

  const GithubListLoaded(this.repos);
}
