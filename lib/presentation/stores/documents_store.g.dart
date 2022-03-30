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
  ObservableFuture<Either<AppError, List<DocumentModel>>>?
      get getDocumentsFuture {
    _$getDocumentsFutureAtom.reportRead();
    return super.getDocumentsFuture;
  }

  @override
  set getDocumentsFuture(
      ObservableFuture<Either<AppError, List<DocumentModel>>>? value) {
    _$getDocumentsFutureAtom.reportWrite(value, super.getDocumentsFuture, () {
      super.getDocumentsFuture = value;
    });
  }

  final _$deleteDocumentFutureAtom =
      Atom(name: 'DocumentsStoreBase.deleteDocumentFuture');

  @override
  ObservableFuture<Either<AppError, void>>? get deleteDocumentFuture {
    _$deleteDocumentFutureAtom.reportRead();
    return super.deleteDocumentFuture;
  }

  @override
  set deleteDocumentFuture(ObservableFuture<Either<AppError, void>>? value) {
    _$deleteDocumentFutureAtom.reportWrite(value, super.deleteDocumentFuture,
        () {
      super.deleteDocumentFuture = value;
    });
  }

  final _$addDocumentFutureAtom =
      Atom(name: 'DocumentsStoreBase.addDocumentFuture');

  @override
  ObservableFuture<Either<AppError, void>>? get addDocumentFuture {
    _$addDocumentFutureAtom.reportRead();
    return super.addDocumentFuture;
  }

  @override
  set addDocumentFuture(ObservableFuture<Either<AppError, void>>? value) {
    _$addDocumentFutureAtom.reportWrite(value, super.addDocumentFuture, () {
      super.addDocumentFuture = value;
    });
  }

  final _$errorTextAtom = Atom(name: 'DocumentsStoreBase.errorText');

  @override
  String? get errorText {
    _$errorTextAtom.reportRead();
    return super.errorText;
  }

  @override
  set errorText(String? value) {
    _$errorTextAtom.reportWrite(value, super.errorText, () {
      super.errorText = value;
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

  final _$deleteDocumentAsyncAction =
      AsyncAction('DocumentsStoreBase.deleteDocument');

  @override
  Future<void> deleteDocument(int index) {
    return _$deleteDocumentAsyncAction.run(() => super.deleteDocument(index));
  }

  @override
  String toString() {
    return '''
documentList: ${documentList},
getDocumentsFuture: ${getDocumentsFuture},
deleteDocumentFuture: ${deleteDocumentFuture},
addDocumentFuture: ${addDocumentFuture},
errorText: ${errorText}
    ''';
  }
}
