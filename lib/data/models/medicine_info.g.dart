// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine_info.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MedicineInfoAdapter extends TypeAdapter<MedicineInfo> {
  @override
  final int typeId = 3;

  @override
  MedicineInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MedicineInfo(
      name: fields[0] as String,
      drugClass: fields[1] as String,
      drugBrand: fields[2] as String,
      drugCode: fields[3] as String,
      drugType: fields[4] as String,
      drugStrength: fields[5] as String,
      drugForm: fields[6] as String,
      administrationRoute: fields[7] as String,
      imageUrl: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, MedicineInfo obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.drugClass)
      ..writeByte(2)
      ..write(obj.drugBrand)
      ..writeByte(3)
      ..write(obj.drugCode)
      ..writeByte(4)
      ..write(obj.drugType)
      ..writeByte(5)
      ..write(obj.drugStrength)
      ..writeByte(6)
      ..write(obj.drugForm)
      ..writeByte(7)
      ..write(obj.administrationRoute)
      ..writeByte(8)
      ..write(obj.imageUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MedicineInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicineInfo _$MedicineInfoFromJson(Map<String, dynamic> json) => MedicineInfo(
      name: json['name'] as String,
      drugClass: json['drugClass'] as String,
      drugBrand: json['drugBrand'] as String,
      drugCode: json['drugCode'] as String,
      drugType: json['drugType'] as String,
      drugStrength: json['drugStrength'] as String,
      drugForm: json['drugForm'] as String,
      administrationRoute: json['administrationRoute'] as String,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$MedicineInfoToJson(MedicineInfo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'drugClass': instance.drugClass,
      'drugBrand': instance.drugBrand,
      'drugCode': instance.drugCode,
      'drugType': instance.drugType,
      'drugStrength': instance.drugStrength,
      'drugForm': instance.drugForm,
      'administrationRoute': instance.administrationRoute,
      'imageUrl': instance.imageUrl,
    };
