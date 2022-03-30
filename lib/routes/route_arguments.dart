import 'package:my_health_app/data/models/document_model.dart';
import 'package:my_health_app/data/models/medication_model.dart';

class AddEditMedicineArgs {
  final bool isEdit;
  final MedicationModel? medicationModel;
  final int? medicationIndex;

  const AddEditMedicineArgs(
      {this.isEdit = false, this.medicationModel, this.medicationIndex});
}

class ViewDocumentArgs {
  final DocumentModel document;
  final int documentIndex;

  const ViewDocumentArgs({required this.document, required this.documentIndex});
}

