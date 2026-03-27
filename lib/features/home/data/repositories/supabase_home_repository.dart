import 'package:supabase_flutter/supabase_flutter.dart';
import '../../domain/entities/project.dart';
import '../../domain/entities/experience.dart';
import '../../domain/entities/education.dart';
import '../../domain/repositories/home_repository.dart';
import '../models/project_model.dart';
import '../models/education_model.dart';

class SupabaseHomeRepository implements HomeRepository {
  final SupabaseClient _client;

  SupabaseHomeRepository(this._client);

  @override
  Future<List<Project>> getProjects() async {
    final response = await _client
        .from('projects')
        .select()
        .order('created_at', ascending: false);

    return (response as List)
        .map((json) => ProjectModel.fromJson(json))
        .toList();
  }

  @override
  Future<List<Education>> getEducation() async {
    final response = await _client
        .from('education')
        .select()1
        .order('id', ascending: true);

    return (response as List)
        .map((json) => EducationModel.fromJson(json))
        .toList();
  }

  @override
  Future<List<Experience>> getExperiences() async {
...

    return [];
  }

  @override
  Future<void> addProject(Project project) async {
    final model = ProjectModel(
      id: '', // Supabase gera o ID
      title: project.title,
      description: project.description,
      imageUrl: project.imageUrl,
      tags: project.tags,
      githubUrl: project.githubUrl,
      liveUrl: project.liveUrl,
      createdAt: DateTime.now(),
    );
    await _client.from('projects').insert(model.toJson());
  }

  @override
  Future<void> updateProject(Project project) async {
    final model = ProjectModel(
      id: project.id,
      title: project.title,
      description: project.description,
      imageUrl: project.imageUrl,
      tags: project.tags,
      githubUrl: project.githubUrl,
      liveUrl: project.liveUrl,
      createdAt: project.createdAt,
    );
    await _client.from('projects').update(model.toJson()).eq('id', project.id);
  }

  @override
  Future<void> deleteProject(String id) async {
    await _client.from('projects').delete().eq('id', id);
  }
}
