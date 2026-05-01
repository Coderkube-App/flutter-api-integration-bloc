import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/theme/app_colors.dart';
import 'routes/app_pages.dart';
import 'data/providers/movie_provider.dart';
import 'data/repositories/movie_repository_impl.dart';
import 'core/network/http_helper.dart';

/// The entry point of the application.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Lock orientation to portrait mode for a consistent UI experience.
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  final httpHelper = HttpHelper();
  final movieProvider = MovieProvider(httpHelper);
  final movieRepository = MovieRepositoryImpl(movieProvider);

  runApp(MyApp(movieRepository: movieRepository));
}

/// The root widget of the application.
class MyApp extends StatelessWidget {
  final MovieRepositoryImpl movieRepository;

  const MyApp({super.key, required this.movieRepository});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return RepositoryProvider<MovieRepositoryImpl>.value(
      value: movieRepository,
      child: MaterialApp(
        title: 'Flutter API Integration',
        debugShowCheckedModeBanner: false,
        
        // Routing setup
        initialRoute: AppPages.INITIAL,
        routes: AppPages.getRoutes(movieRepository),

        theme: ThemeData(
          fontFamily: 'Kanit',
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryLight,
              foregroundColor: AppColors.textPrimary,
              textStyle: const TextStyle(
                fontSize: 20,
                height: 1,
                fontFamily: 'Kanit',
                fontWeight: FontWeight.w400,
              ),
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(36),
              ),
            ),
          ),
          textButtonTheme: TextButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              foregroundColor: AppColors.primary,
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(34),
              ),
            ),
          ),
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            titleTextStyle: TextStyle(
              fontFamily: 'Kanit',
              fontSize: 28,
              fontWeight: FontWeight.w500,
              color: AppColors.backgroundButtonBrown,
              height: 1,
            ),
          ),
        ),
        builder: (context, child) {
          final mediaQueryData = MediaQuery.of(context);
          return Directionality(
            textDirection: TextDirection.ltr,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: MediaQuery(
                data: mediaQueryData.copyWith(
                  textScaler: const TextScaler.linear(1.0),
                ),
                child: ScrollConfiguration(
                  behavior: AppBehavior(),
                  child: SafeArea(
                    top: false,
                    left: false,
                    right: false,
                    child: child!,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class AppBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return child;
  }
}

