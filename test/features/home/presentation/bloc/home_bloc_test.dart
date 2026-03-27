import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:portifolio_app/features/home/domain/entities/project.dart';
import 'package:portifolio_app/features/home/domain/repositories/home_repository.dart';
import 'package:portifolio_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:portifolio_app/features/home/presentation/bloc/home_bloc_states.dart';

class MockHomeRepository extends Mock implements HomeRepository {}

void main() {
  late HomeBloc homeBloc;
  late MockHomeRepository mockRepository;

  setUp(() {
    mockRepository = MockHomeRepository();
    homeBloc = HomeBloc(repository: mockRepository);
  });

  tearDown(() {
    homeBloc.close();
  });

  final tProjects = [
    Project(
      id: '1',
      title: 'Project 1',
      description: 'Desc 1',
      tags: ['Tag 1'],
      createdAt: DateTime.now(),
    )
  ];

  group('HomeBloc Tests', () {
    test('initial state should be HomeInitial', () {
      expect(homeBloc.state, HomeInitial());
    });

    blocTest<HomeBloc, HomeState>(
      'should emit [HomeLoading, HomeLoaded] when GetProjectsEvent is added successfully',
      build: () {
        when(() => mockRepository.getProjects()).thenAnswer((_) async => tProjects);
        return homeBloc;
      },
      act: (bloc) => bloc.add(GetProjectsEvent()),
      expect: () => [
        HomeLoading(),
        HomeLoaded(tProjects),
      ],
      verify: (_) {
        verify(() => mockRepository.getProjects()).called(1);
      },
    );

    blocTest<HomeBloc, HomeState>(
      'should emit [HomeLoading, HomeError] when GetProjectsEvent fails',
      build: () {
        when(() => mockRepository.getProjects()).thenThrow(Exception('Server Error'));
        return homeBloc;
      },
      act: (bloc) => bloc.add(GetProjectsEvent()),
      expect: () => [
        HomeLoading(),
        isA<HomeError>(),
      ],
    );
  });
}
