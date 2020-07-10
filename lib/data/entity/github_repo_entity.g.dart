// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'github_repo_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GithubRepositoryEntity _$GithubRepositoryEntityFromJson(
    Map<String, dynamic> json) {
  return GithubRepositoryEntity(
    name: json['name'] as String,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$GithubRepositoryEntityToJson(
        GithubRepositoryEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
    };
