import 'package:dartz/dartz.dart';
import 'package:my_health_app/data/models/medication_model.dart';
import 'package:my_health_app/domain/entities/app_error.dart';
import 'package:my_health_app/domain/entities/usecase.dart';
import 'package:my_health_app/domain/repositories/medications_repository.dart';

class AddMedication extends UseCase<void, MedicationModel> {
  final MedicationsRepository _medicationsRepository;

  AddMedication(this._medicationsRepository);

  @override
  Future<Either<AppError, void>> call(MedicationModel params) async =>
      await _medicationsRepository.addMedication(params);
}
