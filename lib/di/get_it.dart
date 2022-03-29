import 'package:get_it/get_it.dart';
import 'package:my_health_app/data/data_sources/data_sources.dart';
import 'package:my_health_app/routes/route_generator.dart';

import '../data/repositories/repositories_impl.dart';
import '../domain/repositories/repositories.dart';

final getIt = GetIt.I;

Future init() async {
  // Register services here

  getIt.registerSingleton<RouteGenerator>(RouteGenerator());

  // Data source Initialization

  getIt.registerLazySingleton<DocumentsRemoteDataSource>(
      () => DocumentsRemoteDataSourceImpl());

  getIt.registerLazySingleton<DocumentsLocalDataSource>(
      () => DocumentsLocalDataSourceImpl());

  getIt.registerLazySingleton<MedicationsRemoteDataSource>(
      () => MedicationsRemoteDataSourceImpl());

  getIt.registerLazySingleton<MedicationsLocalDataSource>(
      () => MedicationsLocalDataSourceImpl());

  // Repository Initialization

  getIt.registerLazySingleton<DocumentsRepository>(() =>
      DocumentsRepositoryImpl(getIt<DocumentsRemoteDataSource>(),
          getIt<DocumentsLocalDataSource>()));

  getIt.registerLazySingleton<MedicationsRepository>(() =>
      MedicationsRepositoryImpl(getIt<MedicationsRemoteDataSource>(),
          getIt<MedicationsLocalDataSource>()));

  // Use cases Initialization

  // Mobx Provider Initialization
}
