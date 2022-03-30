import 'package:dartz/dartz.dart';
import 'package:my_health_app/domain/entities/app_error.dart';
import 'package:my_health_app/domain/entities/params/get_medicine_params.dart';
import 'package:my_health_app/domain/entities/usecase.dart';
import 'package:my_health_app/domain/repositories/medications_repository.dart';

import '../../../data/models/medicine_info.dart';

class GetMedicineList extends UseCase<List<MedicineInfo>, GetMedicineParams> {
  final MedicationsRepository _medicationsRepository;

  GetMedicineList(this._medicationsRepository);

  @override
  Future<Either<AppError, List<MedicineInfo>>> call(
          GetMedicineParams params) async =>
      await _medicationsRepository.getMedicinesWithQuery(params.toJson());
}
