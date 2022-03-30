import 'package:dartz/dartz.dart';
import 'package:my_health_app/domain/entities/app_error.dart';
import 'package:my_health_app/domain/entities/params/add_medication_params.dart';
import 'package:my_health_app/domain/entities/usecase.dart';
import 'package:my_health_app/domain/repositories/medications_repository.dart';

class AddMedication extends UseCase<void, AddMedicationParams> {
  final MedicationsRepository _medicationsRepository;

  AddMedication(this._medicationsRepository);

  @override
  Future<Either<AppError, void>> call(AddMedicationParams params) async =>
      await _medicationsRepository.addMedication(params.medicationModel);
}
