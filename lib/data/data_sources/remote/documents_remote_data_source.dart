import 'package:my_health_app/data/models/document_model.dart';

abstract class DocumentsRemoteDataSource {
  Future<List<DocumentModel>> getDocuments();
}

class DocumentsRemoteDataSourceImpl implements DocumentsRemoteDataSource {
  @override
  Future<List<DocumentModel>> getDocuments() {
    // TODO: implement getDocuments
    throw UnimplementedError();
  }
}
