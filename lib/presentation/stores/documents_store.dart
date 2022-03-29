import 'package:mobx/mobx.dart';
import 'package:my_health_app/data/models/document_model.dart';
import 'package:my_health_app/domain/repositories/documents_repository.dart';

part 'documents_store.g.dart';

class DocumentsStore = DocumentsStoreBase with _$DocumentsStore;

abstract class DocumentsStoreBase with Store {
  final DocumentsRepository _documentsRepository;

  DocumentsStoreBase(this._documentsRepository);

  @observable
  ObservableList<DocumentModel> documentList = ObservableList<DocumentModel>();

  @observable
   late ObservableFuture getDocumentsFuture;

  @action
  Future<void> getDocuments() async {
    getDocumentsFuture = ObservableFuture(_documentsRepository.getDocuments());

    documentList.addAll(await getDocumentsFuture);
  }

  @action
  Future<void> addDocument(DocumentModel document) async {
    await _documentsRepository.addDocument(document);
    documentList.add(document);
  }
}
