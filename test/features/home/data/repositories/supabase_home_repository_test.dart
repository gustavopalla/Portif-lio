1import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:portifolio_app/features/home/data/repositories/supabase_home_repository.dart';

class MockSupabaseClient extends Mock implements SupabaseClient {}
class MockPostgrestQueryBuilder extends Mock implements PostgrestQueryBuilder<List<Map<String, dynamic>>> {}
class MockPostgrestFilterBuilder extends Mock implements PostgrestFilterBuilder<List<Map<String, dynamic>>> {}
class MockPostgrestTransformBuilder extends Mock implements PostgrestTransformBuilder<List<Map<String, dynamic>>> {}

void main() {
  late SupabaseHomeRepository repository;
  late MockSupabaseClient mockClient;
  late MockPostgrestQueryBuilder mockQueryBuilder;
  late MockPostgrestFilterBuilder mockFilterBuilder;
  late MockPostgrestTransformBuilder mockTransformBuilder;

  setUp(() {
    mockClient = MockSupabaseClient();
    mockQueryBuilder = MockPostgrestQueryBuilder();
    mockFilterBuilder = MockPostgrestFilterBuilder();
    mockTransformBuilder = MockPostgrestTransformBuilder();
    repository = SupabaseHomeRepository(mockClient);
  });

  group('getProjects', () {
    test('should return a list of Projects when the call is successful', () async {
      // arrange
      final tProjectsJson = [
        {
          'id': '1',
          'title': 'Project 1',
          'description': 'Desc 1',
          'tags': ['Tag 1'],
          'created_at': '2023-01-01T00:00:00.000Z',
        }
      ];

      when(() => mockClient.from(any())).thenReturn(mockQueryBuilder);
      when(() => mockQueryBuilder.select(any())).thenReturn(mockFilterBuilder);
      when(() => mockFilterBuilder.order(any(), ascending: any())).thenAnswer((_) async => tProjectsJson);

      // act
      final result = await repository.getProjects();

      // assert
      expect(result.length, 1);
      expect(result.first.title, 'Project 1');
      verify(() => mockClient.from('projects')).called(1);
    });
  });
}
