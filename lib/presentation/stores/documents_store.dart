import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';
import 'package:my_health_app/data/models/document_model.dart';
import 'package:my_health_app/domain/entities/app_error.dart';
import 'package:my_health_app/domain/entities/params/add_document_params.dart';
import 'package:my_health_app/domain/entities/params/no_params.dart';
import 'package:my_health_app/domain/usecases/documents/delete_document.dart';
import 'package:my_health_app/domain/usecases/documents/get_documents.dart';

import '../../domain/entities/params/delete_document_params.dart';
import '../../domain/usecases/documents/add_document.dart';

part 'documents_store.g.dart';

class DocumentsStore = DocumentsStoreBase with _$DocumentsStore;

abstract class DocumentsStoreBase with Store {
  late final AddDocument _addDocument;
  late final DeleteDocument _deleteDocument;
  late final GetDocuments _getDocuments;

  DocumentsStoreBase(
      {required AddDocument addDocument,
      required DeleteDocument deleteDocument,
      required GetDocuments getDocuments}) {
    _addDocument = addDocument;
    _deleteDocument = deleteDocument;
    _getDocuments = getDocuments;
  }

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
    getDocumentsFuture ??= ObservableFuture(_getDocuments(NoParams()));
    final response = await getDocumentsFuture;
    response?.fold((l) => errorText = 'Some error occurred',
        (r) => documentList.addAll(r));
  }

  @action
  Future<void> addDocument(DocumentModel document) async {
    addDocumentFuture =
        ObservableFuture(_addDocument(AddDocumentParams(document: document)));
    await addDocumentFuture;
    documentList.add(document);
  }

  @action
  Future<void> deleteDocument(int index) async {
    deleteDocumentFuture = ObservableFuture(
        _deleteDocument(DeleteDocumentParams(documentId: index)));
    await deleteDocumentFuture;
    documentList.removeAt(index);
  }
}
