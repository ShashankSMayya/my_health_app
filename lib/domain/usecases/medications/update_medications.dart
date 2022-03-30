import 'package:dartz/dartz.dart';
import 'package:my_health_app/domain/entities/app_error.dart';
import 'package:my_health_app/domain/entities/params/update_medication_params.dart';
import 'package:my_health_app/domain/entities/usecase.dart';
import 'package:my_health_app/domain/repositories/medications_repository.dart';

class UpdateMedication extends UseCase<void, UpdateMedicationParams> {
  final MedicationsRepository _medicationsRepository;

  UpdateMedication(this._medicationsRepository);

  @override
  Future<Either<AppError, void>> call(UpdateMedicationParams params) async =>
      await _medicationsRepository.updateMedication(
          params.medication, params.medicationId);
}
