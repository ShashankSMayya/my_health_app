import 'package:my_health_app/data/data_sources/data_sources.dart';
import 'package:my_health_app/domain/repositories/medications_repository.dart';

class MedicationsRepositoryImpl implements MedicationsRepository {
  final MedicationsRemoteDataSource _medicationsRemoteDataSource;
  final MedicationsLocalDataSource _medicationsLocalDataSource;

  const MedicationsRepositoryImpl(
      this._medicationsRemoteDataSource, this._medicationsLocalDataSource);
}
