import 'package:dartz/dartz.dart';
import 'package:my_health_app/domain/entities/app_error.dart';
import 'package:my_health_app/domain/entities/params/delete_document_params.dart';
import 'package:my_health_app/domain/entities/usecase.dart';
import 'package:my_health_app/domain/repositories/documents_repository.dart';

class DeleteDocument extends UseCase<void, DeleteDocumentParams> {
  final DocumentsRepository _documentsRepository;

  DeleteDocument(this._documentsRepository);

  @override
  Future<Either<AppError, void>> call(DeleteDocumentParams params) async =>
      await _documentsRepository.deleteDocument(params.documentId);
}
