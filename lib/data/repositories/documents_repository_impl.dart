import 'dart:ffi';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:my_health_app/data/data_sources/data_sources.dart';
import 'package:my_health_app/data/models/document_model.dart';
import 'package:my_health_app/domain/entities/app_error.dart';
import 'package:my_health_app/domain/repositories/documents_repository.dart';

class DocumentsRepositoryImpl implements DocumentsRepository {
  final DocumentsRemoteDataSource _documentsRemoteDataSource;
  final DocumentsLocalDataSource _documentsLocalDataSource;

  const DocumentsRepositoryImpl(
      this._documentsRemoteDataSource, this._documentsLocalDataSource);

  @override
  Future<Either<AppError, void>> addDocument(DocumentModel document) async {
    try {
      await _documentsLocalDataSource.addDocument(document);
      return const Right(Void);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception catch (e) {
      return Left(AppError(AppErrorType.other, error: e.toString()));
    }
  }

  @override
  Future<Either<AppError, void>> deleteDocument(int documentId) async {
    try {
      await _documentsLocalDataSource.deleteDocument(documentId);
      return const Right(Void);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception catch (e) {
      return Left(AppError(AppErrorType.other, error: e.toString()));
    }
  }

  @override
  Future<Either<AppError, List<DocumentModel>>> getDocuments() async {
    try {
      final docList = await _documentsLocalDataSource.getDocuments();
      return Right(docList);
    } on SocketException {
      return const Left(AppError(AppErrorType.network));
    } on Exception catch (e) {
      return Left(AppError(AppErrorType.other, error: e.toString()));
    }
  }
}
