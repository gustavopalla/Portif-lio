import 'package:flutter_test/flutter_test.dart';
import 'package:portifolio_app/features/home/data/models/project_model.dart';
import 'package:portifolio_app/features/home/domain/entities/project.dart';

void main() {
  final tProjectModel = ProjectModel(
    id: '1',
    title: 'Test Project',
    description: 'Description',
    tags: ['Flutter', 'Supabase'],
    createdAt: DateTime.parse('2023-01-01T00:00:00.000Z'),
  );

  group('ProjectModel Serialization', () {
    test('should be a subclass of Project entity', () {
      expect(tProjectModel, isA<Project>());
    });

    test('fromJson should return a valid model when the JSON is correct', () {
      // arrange
      final Map<String, dynamic> jsonMap = {
        'id': '1',
        'title': 'Test Project',
        'description': 'Description',
        'tags': ['Flutter', 'Supabase'],
        'created_at': '2023-01-01T00:00:00.000Z',
      };
      
      // act
      final result = ProjectModel.fromJson(jsonMap);
      
      // assert
      expect(result.id, tProjectModel.id);
      expect(result.title, tProjectModel.title);
      expect(result.tags, containsAll(['Flutter', 'Supabase']));
    });

    test('toJson should return a JSON map containing the proper data', () {
      // act
      final result = tProjectModel.toJson();
      
      // assert
      final expectedMap = {
        'title': 'Test Project',
        'description': 'Description',
        'image_url': null,
        'tags': ['Flutter', 'Supabase'],
        'github_url': null,
        'live_url': null,
      };
      expect(result, expectedMap);
    });
  });
}
