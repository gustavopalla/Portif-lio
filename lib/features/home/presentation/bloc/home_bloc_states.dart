import 'package:equatable/equatable.dart';
import '../../domain/entities/project.dart';

abstract class HomeState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}
class HomeLoading extends HomeState {}
class HomeLoaded extends HomeState {
  final List<Project> projects;
  HomeLoaded(this.projects);

  @override
  List<Object?> get props => [projects];
}
class HomeError extends HomeState {
  final String message;
  HomeError(this.message);

  @override
  List<Object?> get props => [message];
}

abstract class HomeEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetProjectsEvent extends HomeEvent {}
