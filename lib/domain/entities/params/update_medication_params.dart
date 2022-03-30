import 'package:my_health_app/data/models/medication_model.dart';

class UpdateMedicationParams {
  final int medicationId;
  final MedicationModel medication;

  const UpdateMedicationParams(
      {required this.medicationId, required this.medication});
}
