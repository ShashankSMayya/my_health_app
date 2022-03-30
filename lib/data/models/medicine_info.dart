import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_health_app/data/constants/hive_constants.dart';

part 'medicine_info.g.dart';

@JsonSerializable()
@HiveType(typeId: HiveTypeIds.medicineInfoTypeId)
class MedicineInfo {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String drugClass;
  @HiveField(2)
  final String drugBrand;
  @HiveField(3)
  final String drugCode;
  @HiveField(4)
  final String drugType;
  @HiveField(5)
  final String drugStrength;
  @HiveField(6)
  final String drugForm;
  @HiveField(7)
  final String administrationRoute;
  @HiveField(8)
  final String? imageUrl;

  MedicineInfo(
      {required this.name,
      required this.drugClass,
      required this.drugBrand,
      required this.drugCode,
      required this.drugType,
      required this.drugStrength,
      required this.drugForm,
      required this.administrationRoute,
      this.imageUrl});

  factory MedicineInfo.fromJson(Map<String, dynamic> json) =>
      _$MedicineInfoFromJson(json);

  Map<String, dynamic> toJson() => _$MedicineInfoToJson(this);
}
