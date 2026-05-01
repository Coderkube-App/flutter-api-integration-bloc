import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class FetchMovies extends HomeEvent {}

class LoadMoreMovies extends HomeEvent {}

class RefreshMovies extends HomeEvent {}
