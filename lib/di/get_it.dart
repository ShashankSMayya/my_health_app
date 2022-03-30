import 'package:get_it/get_it.dart';
import 'package:my_health_app/data/data_sources/data_sources.dart';
import 'package:my_health_app/domain/usecases/documents/add_document.dart';
import 'package:my_health_app/domain/usecases/documents/delete_document.dart';
import 'package:my_health_app/domain/usecases/documents/get_documents.dart';
import 'package:my_health_app/domain/usecases/medications/add_medications.dart';
import 'package:my_health_app/domain/usecases/medications/delete_medication.dart';
import 'package:my_health_app/domain/usecases/medications/get_medications.dart';
import 'package:my_health_app/domain/usecases/medications/get_medicine_list.dart';
import 'package:my_health_app/domain/usecases/medications/update_medications.dart';
import 'package:my_health_app/presentation/stores/documents_store.dart';
import 'package:my_health_app/presentation/stores/medication_store.dart';
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

  getIt.registerFactory<GetDocuments>(() => GetDocuments(getIt()));

  getIt.registerFactory<AddDocument>(() => AddDocument(getIt()));

  getIt.registerFactory<DeleteDocument>(() => DeleteDocument(getIt()));

  getIt.registerFactory<AddMedication>(() => AddMedication(getIt()));

  getIt.registerFactory<GetMedications>(() => GetMedications(getIt()));

  getIt.registerFactory<UpdateMedication>(() => UpdateMedication(getIt()));

  getIt.registerFactory<GetMedicineList>(() => GetMedicineList(getIt()));

  getIt.registerFactory<DeleteMedication>(() => DeleteMedication(getIt()));



  // Mobx Store Initialization

  getIt.registerFactory<DocumentsStore>(() => DocumentsStore(
      addDocument: getIt(), getDocuments: getIt(), deleteDocument: getIt()));

  getIt.registerFactory<MedicationStore>(() => MedicationStore(
      addMedication: getIt(),
      updateMedication: getIt(),
      deleteMedication: getIt(),
      getMedications: getIt()));
}
