import 'package:dartz/dartz.dart';
import 'package:my_health_app/data/models/document_model.dart';
import 'package:my_health_app/domain/entities/app_error.dart';

abstract class DocumentsRepository {
  Future<Either<AppError, List<DocumentModel>>> getDocuments();

  Future<Either<AppError, void>> addDocument(DocumentModel document);

  Future<Either<AppError, void>> deleteDocument(int documentId);
}
