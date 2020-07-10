import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/features/github/list/github_list_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GithubListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GithubBloc, GithubState>(
        bloc: GetIt.instance.get<GithubBloc>(),
        builder: (context, state) {
          if (state is InitialGithubListState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            final currentState = state as GithubListLoaded;
            final repos = currentState.repos;

            return ListView.builder(
              itemCount: repos.length,
              itemBuilder: (context, index) {
                final member = repos[index];

                return ListTile(
                    title: Text(
                      member.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(member.description));
              },
            );
          }
        });
  }
}
