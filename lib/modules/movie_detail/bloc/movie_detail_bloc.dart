import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/repositories/movie_repository.dart';
import 'movie_detail_event.dart';
import 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final MovieRepository _movieRepository;

  MovieDetailBloc(this._movieRepository) : super(MovieDetailInitial()) {
    on<FetchMovieDetail>(_onFetchMovieDetail);
  }

  Future<void> _onFetchMovieDetail(FetchMovieDetail event, Emitter<MovieDetailState> emit) async {
    emit(MovieDetailLoading());
    try {
      final detail = await _movieRepository.getMovieDetail(event.movieId);
      emit(MovieDetailLoaded(detail));
    } catch (e) {
      emit(MovieDetailError('Failed to fetch movie details: $e'));
    }
  }
}
