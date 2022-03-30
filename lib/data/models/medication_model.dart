import 'package:hive/hive.dart';
import 'package:my_health_app/data/constants/enums.dart';
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
  @HiveField(5)
  final DateTime addedDate;
  @HiveField(6)
  final DateTime updatedDate;
  @HiveField(7)
  final int frequency;
  @HiveField(8)
  final List<String> dosingTimes;
  @HiveField(9)
  final FrequencyTypes frequencyType;

  MedicationModel({
    required this.medicineInfo,
    required this.doseAmount,
    required this.doseUnit,
    required this.instructions,
    required this.prescriptionReason,
    required this.addedDate,
    required this.updatedDate,
    required this.frequency,
    required this.dosingTimes,
    required this.frequencyType,

  });

  MedicationModel copyWith({
    MedicineInfo? medicineInfo,
    int? doseAmount,
    String? doseUnit,
    String? instructions,
    String? prescriptionReason,
    DateTime? updatedDate,
    int? frequency,
    List<String>? dosingTimes,
    FrequencyTypes? frequencyType,
  }) {
    return MedicationModel(
      medicineInfo: medicineInfo ?? this.medicineInfo,
      doseAmount: doseAmount ?? this.doseAmount,
      doseUnit: doseUnit ?? this.doseUnit,
      instructions: instructions ?? this.instructions,
      prescriptionReason: prescriptionReason ?? this.prescriptionReason,
      addedDate: addedDate,
      frequencyType: frequencyType ?? this.frequencyType,
      updatedDate: updatedDate ?? this.updatedDate,
      frequency: frequency ?? this.frequency,
      dosingTimes: dosingTimes ?? this.dosingTimes,
    );
  }
}
