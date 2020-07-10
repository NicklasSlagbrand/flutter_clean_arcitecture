import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'github_repo_entity.g.dart';

@JsonSerializable()
class GithubRepositoryEntity extends Equatable {
  final String name;
  final String description;

  GithubRepositoryEntity({this.name, this.description});

  factory GithubRepositoryEntity.fromJson(Map<String, dynamic> json) =>
      _$GithubRepositoryEntityFromJson(json);

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
      };

  @override
  List<Object> get props => [name, description];
}
