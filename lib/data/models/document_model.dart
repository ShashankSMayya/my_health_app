import 'dart:typed_data';

import 'package:hive/hive.dart';
import 'package:my_health_app/data/constants/enums.dart';
import 'package:my_health_app/data/constants/hive_constants.dart';
import 'package:my_health_app/utils/file_utils.dart';

part 'document_model.g.dart';

@HiveType(typeId: HiveTypeIds.documentTypeId)
class DocumentModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final Uint8List fileBytes;
  @HiveField(2)
  final FileTypes fileType;
  @HiveField(3)
  final String fileName;
  @HiveField(4)
  final String fileExtension;
  @HiveField(5)
  final DateTime uploadDate;
  @HiveField(6)
  final DateTime lastModified;

  String get fileSize => FileUtils.getFileSizeString(bytes: fileBytes.length);

  const DocumentModel({
    required this.name,
    required this.fileBytes,
    required this.fileType,
    required this.fileName,
    required this.fileExtension,
    required this.uploadDate,
    required this.lastModified,
  });

  DocumentModel copyWith({
    String? name,
    Uint8List? fileBytes,
    FileTypes? fileType,
    String? fileName,
    String? fileExtension,
    DateTime? lastModified,
  }) {
    return DocumentModel(
      name: name ?? this.name,
      fileBytes: fileBytes ?? this.fileBytes,
      fileType: fileType ?? this.fileType,
      fileName: fileName ?? this.fileName,
      fileExtension: fileExtension ?? this.fileExtension,
      uploadDate: uploadDate,
      lastModified: lastModified ?? this.lastModified,
    );
  }
}
