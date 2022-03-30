import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:my_health_app/data/models/document_model.dart';
import 'package:my_health_app/domain/entities/app_error.dart';
import 'package:my_health_app/domain/repositories/documents_repository.dart';

part 'documents_store.g.dart';

class DocumentsStore = DocumentsStoreBase with _$DocumentsStore;

abstract class DocumentsStoreBase with Store {
  final DocumentsRepository _documentsRepository;

  DocumentsStoreBase(this._documentsRepository);

  @observable
  ObservableList<DocumentModel> documentList = ObservableList<DocumentModel>();

  @observable
  ObservableFuture<Either<AppError, List<DocumentModel>>>? getDocumentsFuture;

  @observable
  ObservableFuture<Either<AppError, void>>? deleteDocumentFuture;

  @observable
  ObservableFuture<Either<AppError, void>>? addDocumentFuture;

  @observable
  String? errorText;

  @action
  Future<void> getDocuments() async {
    documentList.clear();
    getDocumentsFuture ??=
        ObservableFuture(_documentsRepository.getDocuments());
    final response = await getDocumentsFuture;
    response?.fold((l) => errorText = 'Some error occurred',
        (r) => documentList.addAll(r));
  }

  @action
  Future<void> addDocument(DocumentModel document) async {
    addDocumentFuture =
        ObservableFuture(_documentsRepository.addDocument(document));
    await addDocumentFuture;
    documentList.add(document);
  }

  @action
  Future<void> deleteDocument(int index) async {
    deleteDocumentFuture =
        ObservableFuture(_documentsRepository.deleteDocument(index));
    await deleteDocumentFuture;
    documentList.removeAt(index);
  }
}