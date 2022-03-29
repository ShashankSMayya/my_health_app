// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'documents_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DocumentsStore on DocumentsStoreBase, Store {
  final _$documentListAtom = Atom(name: 'DocumentsStoreBase.documentList');

  @override
  ObservableList<DocumentModel> get documentList {
    _$documentListAtom.reportRead();
    return super.documentList;
  }

  @override
  set documentList(ObservableList<DocumentModel> value) {
    _$documentListAtom.reportWrite(value, super.documentList, () {
      super.documentList = value;
    });
  }

  final _$getDocumentsFutureAtom =
      Atom(name: 'DocumentsStoreBase.getDocumentsFuture');

  @override
  ObservableFuture<dynamic> get getDocumentsFuture {
    _$getDocumentsFutureAtom.reportRead();
    return super.getDocumentsFuture;
  }

  @override
  set getDocumentsFuture(ObservableFuture<dynamic> value) {
    _$getDocumentsFutureAtom.reportWrite(value, super.getDocumentsFuture, () {
      super.getDocumentsFuture = value;
    });
  }

  final _$getDocumentsAsyncAction =
      AsyncAction('DocumentsStoreBase.getDocuments');

  @override
  Future<void> getDocuments() {
    return _$getDocumentsAsyncAction.run(() => super.getDocuments());
  }

  final _$addDocumentAsyncAction =
      AsyncAction('DocumentsStoreBase.addDocument');

  @override
  Future<void> addDocument(DocumentModel document) {
    return _$addDocumentAsyncAction.run(() => super.addDocument(document));
  }

  @override
  String toString() {
    return '''
documentList: ${documentList},
getDocumentsFuture: ${getDocumentsFuture}
    ''';
  }
}
