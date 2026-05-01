import 'package:equatable/equatable.dart';
import '../../../domain/entities/movie_entity.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<MovieEntity> movies;
  final bool hasReachedMax;
  final bool isMoreLoading;
  final int currentPage;

  const HomeLoaded({
    required this.movies,
    this.hasReachedMax = false,
    this.isMoreLoading = false,
    this.currentPage = 1,
  });

  HomeLoaded copyWith({
    List<MovieEntity>? movies,
    bool? hasReachedMax,
    bool? isMoreLoading,
    int? currentPage,
  }) {
    return HomeLoaded(
      movies: movies ?? this.movies,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      isMoreLoading: isMoreLoading ?? this.isMoreLoading,
      currentPage: currentPage ?? this.currentPage,
    );
  }

  @override
  List<Object?> get props => [movies, hasReachedMax, isMoreLoading, currentPage];
}

class HomeError extends HomeState {
  final String message;

  const HomeError(this.message);

  @override
  List<Object?> get props => [message];
}
