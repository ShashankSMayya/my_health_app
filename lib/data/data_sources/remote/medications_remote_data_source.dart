import 'package:my_health_app/data/mock_data/medicine_info.dart';
import 'package:my_health_app/data/models/medicine_info.dart';

abstract class MedicationsRemoteDataSource {
  Future<List<MedicineInfo>> getMedicinesWithQuery(
      Map<String, dynamic> queryParams);
}

class MedicationsRemoteDataSourceImpl implements MedicationsRemoteDataSource {
  @override
  Future<List<MedicineInfo>> getMedicinesWithQuery(
      Map<String, dynamic> queryParams) {
    final List<MedicineInfo> medInfo = medicineInfo
        .map((e) => MedicineInfo.fromJson(e))
        .toList()
        .where((element) => element.name
            .toLowerCase()
            .contains(queryParams['query'].toLowerCase()))
        .toList();
    return Future.delayed(const Duration(seconds: 2), () => medInfo);
  }
}
