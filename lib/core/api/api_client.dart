import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:my_health_app/data/mock_data/medicine_info.dart';

class ApiClient {
  final Dio _dio;
  final DioAdapter _dioAdapter;

  ApiClient(this._dio, this._dioAdapter) {
    _dioAdapter.onGet('https://api_mock/getMedicines', (server) {
      server.reply(200, medicineInfo);
    });
  }

  dynamic get(String path) async {
    final response = await _dio.get(
      path,
    );
    return response.data;
  }
}
