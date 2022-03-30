// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medication_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MedicationModelAdapter extends TypeAdapter<MedicationModel> {
  @override
  final int typeId = 1;

  @override
  MedicationModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MedicationModel(
      medicineInfo: fields[0] as MedicineInfo,
      doseAmount: fields[1] as int,
      doseUnit: fields[2] as String,
      instructions: fields[3] as String,
      prescriptionReason: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MedicationModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.medicineInfo)
      ..writeByte(1)
      ..write(obj.doseAmount)
      ..writeByte(2)
      ..write(obj.doseUnit)
      ..writeByte(3)
      ..write(obj.instructions)
      ..writeByte(4)
      ..write(obj.prescriptionReason);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MedicationModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
