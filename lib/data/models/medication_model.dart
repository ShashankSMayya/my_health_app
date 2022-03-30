import 'package:hive/hive.dart';
import 'package:my_health_app/data/constants/hive_constants.dart';
import 'package:my_health_app/data/models/medicine_info.dart';

part 'medication_model.g.dart';

@HiveType(typeId: HiveTypeIds.medicationTypeId)
class MedicationModel {
  @HiveField(0)
  final MedicineInfo medicineInfo;
  @HiveField(1)
  final int doseAmount;
  @HiveField(2)
  final String doseUnit;
  @HiveField(3)
  final String instructions;
  @HiveField(4)
  final String prescriptionReason;

  MedicationModel({
    required this.medicineInfo,
    required this.doseAmount,
    required this.doseUnit,
    required this.instructions,
    required this.prescriptionReason,
  });
}
