// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enums.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FileTypesAdapter extends TypeAdapter<FileTypes> {
  @override
  final int typeId = 2;

  @override
  FileTypes read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return FileTypes.image;
      case 1:
        return FileTypes.pdf;
      default:
        return FileTypes.image;
    }
  }

  @override
  void write(BinaryWriter writer, FileTypes obj) {
    switch (obj) {
      case FileTypes.image:
        writer.writeByte(0);
        break;
      case FileTypes.pdf:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FileTypesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FrequencyTypesAdapter extends TypeAdapter<FrequencyTypes> {
  @override
  final int typeId = 4;

  @override
  FrequencyTypes read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return FrequencyTypes.day;
      case 1:
        return FrequencyTypes.week;
      default:
        return FrequencyTypes.day;
    }
  }

  @override
  void write(BinaryWriter writer, FrequencyTypes obj) {
    switch (obj) {
      case FrequencyTypes.day:
        writer.writeByte(0);
        break;
      case FrequencyTypes.week:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FrequencyTypesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
