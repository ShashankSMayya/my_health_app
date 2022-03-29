import 'package:hive/hive.dart';
import 'package:my_health_app/data/constants/hive_constants.dart';
import 'package:my_health_app/data/models/document_model.dart';

abstract class DocumentsLocalDataSource {
  Future<List<DocumentModel>> getDocuments();

  Future<void> addDocument(DocumentModel document);

  Future<void> deleteDocument(int documentId);
  
  Future<void> updateDocument(DocumentModel document);
}

class DocumentsLocalDataSourceImpl implements DocumentsLocalDataSource {
  @override
  Future<void> addDocument(DocumentModel document) async {
    final docBox =
        await Hive.openBox<DocumentModel>(HiveBoxNames.documentBoxName);
    await docBox.add(document);
    return;
  }

  @override
  Future<void> deleteDocument(int documentId) async {
    final docBox =
        await Hive.openBox<DocumentModel>(HiveBoxNames.documentBoxName);
    await docBox.deleteAt(documentId);
    return;
  }

  @override
  Future<List<DocumentModel>> getDocuments() async {
    final docBox =
        await Hive.openBox<DocumentModel>(HiveBoxNames.documentBoxName);
    final documents = docBox.values.toList();
    return documents;
  }

  @override
  Future<void> updateDocument(DocumentModel document) {
    // TODO: implement updateDocument
    throw UnimplementedError();
  }
}
