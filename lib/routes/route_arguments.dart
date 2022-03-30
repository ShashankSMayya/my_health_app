import 'package:my_health_app/data/models/document_model.dart';

class AddEditMedicineArgs {
  final bool isEdit;

  const AddEditMedicineArgs({this.isEdit = false});
}

class ViewDocumentArgs {
  final DocumentModel document;
  final int documentIndex;

  const ViewDocumentArgs({required this.document, required this.documentIndex});
}
