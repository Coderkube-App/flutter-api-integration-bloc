import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/repositories/movie_repository.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final MovieRepository _movieRepository;

  HomeBloc(this._movieRepository) : super(HomeInitial()) {
    on<FetchMovies>(_onFetchMovies);
    on<LoadMoreMovies>(_onLoadMoreMovies);
    on<RefreshMovies>(_onRefreshMovies);
  }

  Future<void> _onFetchMovies(FetchMovies event, Emitter<HomeState> emit) async {
    emit(HomeLoading());
    try {
      final movies = await _movieRepository.getMovies(1);
      emit(HomeLoaded(
        movies: movies,
        hasReachedMax: movies.isEmpty,
        currentPage: 2,
      ));
    } catch (e) {
      emit(HomeError('Failed to fetch movies: $e'));
    }
  }

  Future<void> _onLoadMoreMovies(LoadMoreMovies event, Emitter<HomeState> emit) async {
    final currentState = state;
    if (currentState is HomeLoaded) {
      if (currentState.hasReachedMax || currentState.isMoreLoading) return;

      emit(currentState.copyWith(isMoreLoading: true));

      try {
        final movies = await _movieRepository.getMovies(currentState.currentPage);
        if (movies.isEmpty) {
          emit(currentState.copyWith(hasReachedMax: true, isMoreLoading: false));
        } else {
          emit(currentState.copyWith(
            movies: List.of(currentState.movies)..addAll(movies),
            currentPage: currentState.currentPage + 1,
            isMoreLoading: false,
          ));
        }
      } catch (e) {
        // In a real app, you might want a separate error state for pagination
        // but for now we'll just stop loading.
        emit(currentState.copyWith(isMoreLoading: false));
      }
    }
  }

  Future<void> _onRefreshMovies(RefreshMovies event, Emitter<HomeState> emit) async {
    try {
      final movies = await _movieRepository.getMovies(1);
      emit(HomeLoaded(
        movies: movies,
        hasReachedMax: movies.isEmpty,
        currentPage: 2,
      ));
    } catch (e) {
      // If refresh fails, we might want to keep the old state or show error.
      // For now, we'll just emit error.
      emit(HomeError('Failed to refresh movies: $e'));
    }
  }
}
