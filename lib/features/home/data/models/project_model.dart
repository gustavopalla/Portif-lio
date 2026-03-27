import '../../domain/entities/project.dart';

class ProjectModel extends Project {
  ProjectModel({
    required super.id,
    required super.title,
    required super.description,
    super.imageUrl,
    required super.tags,
    super.githubUrl,
    super.liveUrl,
    required super.createdAt,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      imageUrl: json['image_url'] as String?,
      tags: List<String>.from(json['tags'] ?? []),
      githubUrl: json['github_url'] as String?,
      liveUrl: json['live_url'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'image_url': imageUrl,
      'tags': tags,
      'github_url': githubUrl,
      'live_url': liveUrl,
    };
  }
}
