import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/home_repository.dart';
import 'home_bloc_states.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository repository;

  HomeBloc({required this.repository}) : super(HomeInitial()) {
    on<GetProjectsEvent>((event, emit) async {
      emit(HomeLoading());
      try {
        final projects = await repository.getProjects();
        emit(HomeLoaded(projects));
      } catch (e) {
        emit(HomeError(e.toString()));
      }
    });
  }
}
