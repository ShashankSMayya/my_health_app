import 'package:dartz/dartz.dart';
import 'package:my_health_app/domain/entities/app_error.dart';
import 'package:my_health_app/domain/entities/usecase.dart';
import 'package:my_health_app/domain/repositories/documents_repository.dart';

import '../../entities/params/add_document_params.dart';

class AddDocument extends UseCase<void, AddDocumentParams> {
  final DocumentsRepository _documentsRepository;

  AddDocument(this._documentsRepository);

  @override
  Future<Either<AppError, void>> call(AddDocumentParams params) async =>
      await _documentsRepository.addDocument(params.document);
}
