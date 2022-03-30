import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:my_health_app/data/data_sources/data_sources.dart';
import 'package:my_health_app/data/models/medication_model.dart';
import 'package:my_health_app/data/models/medicine_info.dart';
import 'package:my_health_app/domain/entities/app_error.dart';
import 'package:my_health_app/domain/entities/params/no_params.dart';
import 'package:my_health_app/domain/repositories/medications_repository.dart';

class MedicationsRepositoryImpl implements MedicationsRepository {
  final MedicationsRemoteDataSource _medicationsRemoteDataSource;
  final MedicationsLocalDataSource _medicationsLocalDataSource;

  const MedicationsRepositoryImpl(
      this._medicationsRemoteDataSource, this._medicationsLocalDataSource);

  @override
  Future<Either<AppError, void>> addMedication(
      MedicationModel medication) async {
    try {
      await _medicationsLocalDataSource.addMedication(medication);
      return const Right(Void);
    } on Exception {
      return Left(const AppError(AppErrorType.other));
    }
  }

  @override
  Future<Either<AppError, void>> deleteMedication(int index) async {
    try {
      await _medicationsLocalDataSource.deleteMedication(index);
      return const Right(Void);
    } on Exception {
      return const Left(AppError(AppErrorType.other));
    }
  }

  @override
  Future<Either<AppError, List<MedicationModel>>> getAllMedications(
      NoParams params) async {
    try {
      final medications = await _medicationsLocalDataSource.getAllMedications();
      return Right(medications);
    } on Exception {
      return const Left(AppError(AppErrorType.other));
    }
  }

  @override
  Future<Either<AppError, List<MedicineInfo>>> getMedicinesWithQuery(
      Map<String, dynamic> params) async {
    try {
      final response =
          await _medicationsRemoteDataSource.getMedicinesWithQuery(params);
      return Right(response);
    } on Exception {
      return const Left(AppError(
        AppErrorType.other,
      ));
    }
  }

  @override
  Future<Either<AppError, void>> updateMedication(
      MedicationModel medication, int index) async {
    try {
      await _medicationsLocalDataSource.updateMedication(medication, index);
      return const Right(Void);
    } on Exception {
      return const Left(AppError(
        AppErrorType.other,
      ));
    }
  }
}
