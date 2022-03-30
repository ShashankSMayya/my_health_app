import 'package:dartz/dartz.dart';
import 'package:my_health_app/data/models/medication_model.dart';
import 'package:my_health_app/domain/entities/app_error.dart';
import 'package:my_health_app/domain/entities/params/no_params.dart';
import 'package:my_health_app/domain/entities/usecase.dart';
import 'package:my_health_app/domain/repositories/medications_repository.dart';

class GetMedications extends UseCase<List<MedicationModel>, NoParams> {
  final MedicationsRepository _medicationsRepository;

  GetMedications(this._medicationsRepository);

  @override
  Future<Either<AppError, List<MedicationModel>>> call(NoParams params) async =>
      await _medicationsRepository.getAllMedications(params);
}
