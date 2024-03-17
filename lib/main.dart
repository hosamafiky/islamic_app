import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:islamic_app/core/helpers/cache_helper.dart';
import 'package:islamic_app/core/routing/app_router.dart';
import 'package:islamic_app/features/quran/data/datasources/quran_local_data_source.dart';
import 'package:islamic_app/features/quran/data/datasources/quran_remote_data_source.dart';
import 'package:islamic_app/features/quran/data/repositories/quran_repository_impl.dart';
import 'package:islamic_app/features/quran/domain/usecases/get_juzs_usecase.dart';
import 'package:islamic_app/features/quran/domain/usecases/get_surahs_usecase.dart';
import 'package:islamic_app/features/quran/presentation/cubit/quran_cubit.dart';

import 'core/globals/global_keys.dart';
import 'core/helpers/dio_helper.dart';
import 'core/observers/bloc_observer.dart';
import 'core/themes/data/themes.dart';
import 'features/quran/domain/usecases/get_pages_usecase.dart';
import 'features/quran/domain/usecases/get_surah_usecase.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();

  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Center(
      child: Text(
        'An error occurred, please restart the app\n${details.exceptionAsString()}',
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.red,
          fontSize: 20,
        ),
      ),
    );
  };
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => QuranCubit(
            getSurahUsecase: GetSurahUsecase(
              QuranRepositoryImpl(
                checker: InternetConnectionChecker(),
                quranLocalDataSource: QuranLocalDatasourceImpl(
                  cacheHelper: CacheHelper(),
                ),
                quranRemoteDataSource: QuranRemoteDatasourceImpl(
                  dioHelper: DioHelper(),
                ),
              ),
            ),
            getPagesUsecase: GetPagesUsecase(
              QuranRepositoryImpl(
                checker: InternetConnectionChecker(),
                quranLocalDataSource: QuranLocalDatasourceImpl(
                  cacheHelper: CacheHelper(),
                ),
                quranRemoteDataSource: QuranRemoteDatasourceImpl(
                  dioHelper: DioHelper(),
                ),
              ),
            ),
            getJuzsUsecase: GetJuzsUsecase(
              QuranRepositoryImpl(
                checker: InternetConnectionChecker(),
                quranLocalDataSource: QuranLocalDatasourceImpl(
                  cacheHelper: CacheHelper(),
                ),
                quranRemoteDataSource: QuranRemoteDatasourceImpl(
                  dioHelper: DioHelper('https://api.quran.com/api/v4/'),
                ),
              ),
            ),
            getSurahsUsecase: GetSurahsUsecase(
              QuranRepositoryImpl(
                checker: InternetConnectionChecker(),
                quranLocalDataSource: QuranLocalDatasourceImpl(
                  cacheHelper: CacheHelper(),
                ),
                quranRemoteDataSource: QuranRemoteDatasourceImpl(
                  dioHelper: DioHelper(),
                ),
              ),
            ),
          )
            ..getSurahs()
            ..getJuzs()
            ..getPages(),
        ),
      ],
      child: MaterialApp(
        scaffoldMessengerKey: snackbarKey,
        navigatorKey: navigatorKey,
        title: 'Islamic App',
        debugShowCheckedModeBanner: false,
        theme: Themes.light,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
