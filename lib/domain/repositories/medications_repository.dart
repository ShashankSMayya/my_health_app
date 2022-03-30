import 'package:dartz/dartz.dart';
import 'package:my_health_app/data/models/medication_model.dart';
import 'package:my_health_app/data/models/medicine_info.dart';
import 'package:my_health_app/domain/entities/app_error.dart';
import 'package:my_health_app/domain/entities/params/no_params.dart';

abstract class MedicationsRepository {
  Future<Either<AppError, List<MedicineInfo>>> getMedicinesWithQuery(
      Map<String, dynamic> params);

  Future<Either<AppError, List<MedicationModel>>> getAllMedications(NoParams params);

  Future<Either<AppError, void>> deleteMedication(int index);

  Future<Either<AppError, void>> addMedication(MedicationModel medication);

  Future<Either<AppError, void>> updateMedication(MedicationModel medication,int index);
}
