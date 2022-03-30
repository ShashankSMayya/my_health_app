import 'package:dartz/dartz.dart';
import 'package:my_health_app/domain/entities/app_error.dart';
import 'package:my_health_app/domain/entities/params/delete_medication_params.dart';
import 'package:my_health_app/domain/entities/usecase.dart';
import 'package:my_health_app/domain/repositories/medications_repository.dart';

class DeleteMedication extends UseCase<void, DeleteMedicationParams> {
  final MedicationsRepository _medicationsRepository;

  DeleteMedication(this._medicationsRepository);

  @override
  Future<Either<AppError, void>> call(DeleteMedicationParams params) async =>
      await _medicationsRepository.deleteMedication(params.medicationId);
}
