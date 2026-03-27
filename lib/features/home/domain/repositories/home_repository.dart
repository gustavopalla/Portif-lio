import '../../domain/entities/project.dart';
import '../../domain/entities/experience.dart';
import '../../domain/entities/education.dart';

abstract class HomeRepository {
  Future<List<Project>> getProjects();
  Future<List<Experience>> getExperiences();
  Future<List<Education>> getEducation();
  
  // Métodos Admin (Ocultos para o público)
  Future<void> addProject(Project project);
  Future<void> updateProject(Project project);
  Future<void> deleteProject(String id);
}
