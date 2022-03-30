import 'package:hive/hive.dart';
import 'package:my_health_app/data/models/medication_model.dart';

import '../../constants/hive_constants.dart';

abstract class MedicationsLocalDataSource {
  Future<List<MedicationModel>> getAllMedications();

  Future<void> deleteMedication(int medicationId);

  Future<void> addMedication(MedicationModel medication);

  Future<void> updateMedication(
      MedicationModel medication, int medicationIndex);
}

class MedicationsLocalDataSourceImpl implements MedicationsLocalDataSource {
  @override
  Future<void> deleteMedication(int medicationId) async {
    final docBox =
        await Hive.openBox<MedicationModel>(HiveBoxNames.medicationBoxName);
    await docBox.deleteAt(medicationId);
    return;
  }

  @override
  Future<List<MedicationModel>> getAllMedications() async {
    final docBox =
        await Hive.openBox<MedicationModel>(HiveBoxNames.medicationBoxName);
    return docBox.values.toList();
  }

  @override
  Future<void> updateMedication(
      MedicationModel medication, int medicationIndex) async {
    final docBox =
        await Hive.openBox<MedicationModel>(HiveBoxNames.medicationBoxName);
    docBox.putAt(medicationIndex, medication);
    return;
  }

  @override
  Future<void> addMedication(MedicationModel medication) async {
    final docBox =
        await Hive.openBox<MedicationModel>(HiveBoxNames.medicationBoxName);
    docBox.add(medication);
    return;
  }
}
