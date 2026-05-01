import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../domain/repositories/movie_repository.dart';
import '../modules/home/bloc/home_bloc.dart';
import '../modules/home/view/home_view.dart';
import '../modules/movie_detail/bloc/movie_detail_bloc.dart';
import '../modules/movie_detail/view/movie_detail_view.dart';

part 'app_routes.dart';

/// A central repository for defining all application pages and their respective providers.
class AppPages {
  /// The initial route displayed when the app starts.
  static const INITIAL = Routes.HOME;

  static Map<String, WidgetBuilder> getRoutes(MovieRepository movieRepository) {
    return {
      Routes.HOME: (context) => BlocProvider(
            create: (context) => HomeBloc(movieRepository),
            child: const HomeView(),
          ),
      Routes.MOVIE_DETAIL: (context) => BlocProvider(
            create: (context) => MovieDetailBloc(movieRepository),
            child: const MovieDetailView(),
          ),
    };
  }
}

