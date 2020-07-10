import 'dart:async';

import 'package:flutter_app/domain/repository/github_repository_impl.dart';
import 'package:flutter_app/features/github/list/github_repo_item.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part '../github_event.dart';
part '../github_state.dart';

class GithubBloc extends Bloc<GithubEvent, GithubState> {
  final GithubRepositoryImpl repositoryImpl;

  GithubBloc(this.repositoryImpl) {
    add(GithubEvent.loadGithubRepositories);
  }

  @override
  GithubState get initialState => InitialGithubListState();

  @override
  Stream<GithubState> mapEventToState(GithubEvent event) async* {
    switch (event) {
      case GithubEvent.loadGithubRepositories:
        var repos = (await repositoryImpl.getGithubRepositories())
            .map((item) => GithubRepoItem(item.name, item.description))
            .toList();

        yield GithubListLoaded(repos);
    }
  }
}
