import 'package:dio/dio.dart';
import 'package:eon_business/src/core/model/station.dart';

abstract interface class StationDataProvider {
  Future<List<Station>> fetchStations();
}

final class StationDataProviderImpl implements StationDataProvider {
  StationDataProviderImpl({required Dio dio}) : _dio = dio;

  final Dio _dio;

  @override
  Future<List<Station>> fetchStations() async {
    final response = await _dio.get('/station');

    return (response.data as List).map((e) => Station.fromJson(e)).toList();
  }
}
