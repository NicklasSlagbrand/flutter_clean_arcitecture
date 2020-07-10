import 'package:equatable/equatable.dart';

class GithubRepositoryModel extends Equatable {
  final String name;
  final String description;

  GithubRepositoryModel({this.name, this.description});

  @override
  List<Object> get props => [name, description];
}
