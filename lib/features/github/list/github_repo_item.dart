import 'package:equatable/equatable.dart';

class GithubRepoItem extends Equatable {
  final String name;
  final String description;

  GithubRepoItem(this.name, this.description);

  @override
  List<Object> get props => [name, description];
}
