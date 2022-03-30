import 'package:hive/hive.dart';
import 'package:my_health_app/data/constants/hive_constants.dart';

part 'enums.g.dart';

@HiveType(typeId: HiveTypeIds.fileTypesTypeId)
enum FileTypes {
  @HiveField(0)
  image,
  @HiveField(1)
  pdf,
}

@HiveType(typeId: HiveTypeIds.daysTypeId)
enum FrequencyTypes {
  @HiveField(0)
  day,
  @HiveField(1)
  week,
}
