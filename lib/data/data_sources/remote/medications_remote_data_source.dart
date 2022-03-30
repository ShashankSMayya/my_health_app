import 'package:my_health_app/core/api/api_client.dart';
import 'package:my_health_app/data/models/medicine_info.dart';

abstract class MedicationsRemoteDataSource {
  Future<List<MedicineInfo>> getMedicinesWithQuery(
      Map<String, dynamic> queryParams);
}

class MedicationsRemoteDataSourceImpl implements MedicationsRemoteDataSource {
  final ApiClient _apiClient;

  MedicationsRemoteDataSourceImpl(this._apiClient);

  @override
  Future<List<MedicineInfo>> getMedicinesWithQuery(
      Map<String, dynamic> queryParams) async {
    await Future.delayed(const Duration(seconds: 2));
    final response = await _apiClient.get('https://api_mock/getMedicines');

    List<MedicineInfo> medicines = response
        .map<MedicineInfo>((json) => MedicineInfo.fromJson(json))
        .toList();
    return medicines
        .where((element) => element.name
            .toLowerCase()
            .contains(queryParams['query'].toLowerCase()))
        .toList();
  }
}
