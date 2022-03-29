import 'package:my_health_app/data/data_sources/data_sources.dart';
import 'package:my_health_app/domain/repositories/documents_repository.dart';

class DocumentsRepositoryImpl implements DocumentsRepository {
  final DocumentsRemoteDataSource _documentsRemoteDataSource;
  final DocumentsLocalDataSource _documentsLocalDataSource;

  const DocumentsRepositoryImpl(
      this._documentsRemoteDataSource, this._documentsLocalDataSource);
}
