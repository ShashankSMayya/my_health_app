import 'package:dartz/dartz.dart';
import 'package:my_health_app/data/models/document_model.dart';
import 'package:my_health_app/domain/entities/app_error.dart';
import 'package:my_health_app/domain/entities/params/no_params.dart';
import 'package:my_health_app/domain/entities/usecase.dart';
import 'package:my_health_app/domain/repositories/documents_repository.dart';

class GetDocuments extends UseCase<List<DocumentModel>, NoParams> {
  final DocumentsRepository _documentsRepository;

  GetDocuments(this._documentsRepository);

  @override
  Future<Either<AppError, List<DocumentModel>>> call(NoParams params) async =>
      await _documentsRepository.getDocuments();
}
